class_name HurtComponent
extends Area2D

@export var tool : DataTypes.Tools = DataTypes.Tools.None

signal hurt # sinal dor

# Função conectada ao sinal de colisão. "corpo entrou na aerea de colisão".
func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent # hit_component será do tipo Hitcomponen ou null sempre. Sera HitComponent caso a area seja do tipo eseprado
	
	if tool == hit_component.current_tool: # caso a ferramenta necessaria para aplicar dano(tool) for igual
		hurt.emit(hit_component.hit_damage) # emiti sinal e envia o argumento de dano 
