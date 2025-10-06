class_name Player
extends CharacterBody2D

var player_direction: Vector2 # Vetor de direções

@export var current_tool : DataTypes.Tools = DataTypes.Tools.None # Armazena ferramenta atual
