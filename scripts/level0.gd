extends Node2D

@onready var Player = $Player

func _on_minibot_2_minibot_done() -> void:
	if Player.has_node("Jetpack"):
		var jetpack = Player.get_node("Jetpack")
		Player.remove_child(jetpack)
