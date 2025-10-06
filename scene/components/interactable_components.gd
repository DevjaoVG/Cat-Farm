class_name InterctableComponents
extends Area2D

# Sinais
signal interctable_activate 
signal interctable_deactivate

# Função conectada ao sinal de colisão. Chamada quando um Objeto entra na area de colisão
func _on_body_entered(body: Node2D) -> void:
	interctable_activate.emit() # emite sinal 


# Função conectada ao sinal de colisão. Chamada quando um Objeto sai da area de colisão
func _on_body_exited(body: Node2D) -> void:
	interctable_deactivate.emit() # emite sinal
