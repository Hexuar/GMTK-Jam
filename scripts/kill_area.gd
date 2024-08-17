extends Area2D

@onready var SpawnLocation = get_parent().get_node("SpawnLocation")

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.position = SpawnLocation.position
