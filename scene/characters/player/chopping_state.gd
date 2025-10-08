extends NodeState

@export var player : Player
@export var animated_sprite_2d : AnimatedSprite2D
@export var collision_shape_2d: CollisionShape2D


func _ready() -> void:
	collision_shape_2d.disabled = true # desativando colisão
	collision_shape_2d.position = Vector2(0,0) # settando posição


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit('walk')


func _on_enter() -> void:
	# Ativando colisão do machado
	collision_shape_2d.disabled = false
	
	# executando animação com base na direção
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("chopping_up") # Reproduzir
		collision_shape_2d.position = Vector2(0,-16) # Reposicionando colisão com base na direação
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("chopping_right")
		collision_shape_2d.position = Vector2(7,-3) # Reposicionando colisão com base na direação
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("chopping_down")
		collision_shape_2d.position = Vector2(0,2) # Reposicionando colisão com base na direação
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("chopping_left")
		collision_shape_2d.position = Vector2(-7,-3) # Reposicionando colisão com base na direação


func _on_exit() -> void:
	animated_sprite_2d.stop()
	collision_shape_2d.disabled = true
