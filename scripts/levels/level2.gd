extends Node2D

@onready var Player = $Player

func _on_minibot_minibot_done() -> void:
	if Player.has_node("Wheel"):
		var jetpack = Player.get_node("Wheel")
		Player.remove_child(jetpack)
