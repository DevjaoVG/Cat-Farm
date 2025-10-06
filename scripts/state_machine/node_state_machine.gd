class_name NodeStateMachine # Indica que esse arquivo é uma "bibloteca" NoteStateMachine
extends Node # Ele sera uma instancia do nó Node (Uma instancia de si memsmo)

# Exportar para o "Inspetor" uma variavel. Essa variavel terá de ser do tipo NodeState
# O No StateMachine terá filhos como "Idle", eles serão do tipo NoteState.
@export var initial_node_state : NodeState  

var node_states : Dictionary = {} # Lista que armazenara os NodeStates/Estados (Idle, Walk, etc)
var current_node_state : NodeState # Será o NoteState/Estado Atual
var current_node_state_name : String # Conterá o nome do Estado

func _ready() -> void: # Por padrão a primera função executada
	for child in get_children(): # A função retornara uma lista com todos os Nõs Filhos diretos
		if child is NodeState: # Se o Nõ retornado é do tipo NodeState/Estado do Jogador
			node_states[child.name.to_lower()] = child # Adiciona cada estado num dicionário, usando o nome do nó como chave
			child.transition.connect(transition_to) # “Quando o estado emitir o sinal transition, chame a função transition_to() e passe os dados junto.”
	
	if initial_node_state: # Verifica se há um NoteState/Estado
		initial_node_state._on_enter() # O NoteState deve possuir a Função onEnter para inicializar instruções do Estado
		current_node_state = initial_node_state # Definindo o NoteState como Estado Atual.


func _process(delta : float) -> void: # _process() é uma função especial do Godot que é chamada uma vez por frame.
	if current_node_state: # Antes de chamar instruções de um Estado, verifica se ele existe.
		current_node_state._on_process(delta) # Chama Função de instruções do Estado.


func _physics_process(delta: float) -> void: # é uma função especial do Godot, chamada uma vez por frame de física (normalmente 60 FPS).
	if current_node_state: # Garante que só chamemos métodos se há um estado ativo.
		current_node_state._on_physics_process(delta) # Chama Metodo do Estado
		current_node_state._on_next_transitions() # Meetodo que verifica condições para troca de Estado


func transition_to(node_state_name : String) -> void: # Função conectada ao Sinal dos NoteStates/Estados do Jogador
	if node_state_name == current_node_state.name.to_lower(): # Se o estado Atual é o Estado emetindo Sinal, Retorna
		return # Retorna evitando redundancia
	
	var new_node_state = node_states.get(node_state_name.to_lower()) # Settando Nome do Novo Estado/NodeState
	
	if !new_node_state: # Se não existir Estado, retorna
		return # Retorna Evitando Erro
	
	if current_node_state: # Se existe Estado Atual
		current_node_state._on_exit() # Chama metodo de interrupção de instruções
	
	new_node_state._on_enter() # Chama metodo para iniciar intruções do novo Estado/NodeState
	
	current_node_state = new_node_state # Atualiza variavel que contem Estado Atual
	current_node_state_name = current_node_state.name.to_lower() # Settando o nome do Estado Atual
	#print("Current State: ", current_node_state_name) # Debug
