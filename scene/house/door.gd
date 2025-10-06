extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape
@onready var interactableComponents: InterctableComponents = $InteractableComponents


func _ready() -> void:
	# Conectando sinais a funções 
	interactableComponents.interctable_activate.connect(on_interactable_activate)
	interactableComponents.interctable_deactivate.connect(on_interactable_desactivate)


# Quando chamado, roda animação OpenDoor e altera o Grupo/layer da colisão
func on_interactable_activate() -> void:
	animated_sprite_2d.play("open_door")
	print("Open")
	collision_layer = 2


# Quando chamado, roda animação CloseDoor e volta layer
func on_interactable_desactivate() -> void:
	animated_sprite_2d.play("close_door")
	collision_layer = 1
