extends Node2D

@onready var Player = get_parent().get_node("Player")

func _on_minibot_2_minibot_done() -> void:
	var jetpack = Player.get_node("Jetpack")
	Player.remove_child(jetpack)
