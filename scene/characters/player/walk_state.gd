extends NodeState

@export var player : Player
@export var animated_sprite_2d : AnimatedSprite2D


func _on_process(_delta : float) -> void:
	player.move_and_slide()



func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputsEvents.movement_inputs()
	
	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_up")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_down")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	
	if direction != Vector2.ZERO:
		player.player_direction = direction
		
	player.velocity = direction.normalized() * 50

	
func _on_next_transitions() -> void:
	if !GameInputsEvents.is_movement_inputs():
		transition.emit("idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
