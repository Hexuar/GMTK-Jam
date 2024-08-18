extends Node2D

@onready var Player = $Player

func _ready() -> void:
	Player.scale = Vector2.ONE/scale
