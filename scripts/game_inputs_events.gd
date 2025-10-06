class_name GameInputsEvents


static var direction : Vector2


# Chegando tecla de movimentação. "Para qual direação?"
static func movement_inputs() -> Vector2:
	if Input.is_action_pressed("move_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("move_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("move_down"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("move_left"):
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	
	return direction


# Chegando se há eventos de movimentação  
static func is_movement_inputs() -> bool:
	if direction == Vector2.ZERO:
		return false
	else:
		return true


# Chegando evento do mouse. "Usar ferramenta"
static func is_used_tool() -> bool:
	var use_value: bool = Input.is_action_pressed("hit")
	
	return use_value
