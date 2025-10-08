class_name DamageComponent
extends Node2D

@export var max_damage: int = 1
@export var current_damage: int = 0

signal max_damage_reached # sinal: maximo dano alcaçado

func apply_damage(damage: int) -> void: # "Dá dano conforme argumento"
	current_damage = clamp(current_damage+damage, 0, max_damage) # Evita que o dano seja maior que max_damage
	
	if current_damage == max_damage: # se "Morreu" emite sinal
		max_damage_reached.emit() 
