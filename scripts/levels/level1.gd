extends Node2D


func _ready() -> void:
	await get_tree().create_timer(3).timeout
	get_node("/root/Main").glitch()
