extends Area2D

@export var Upgrade : String

var hasEntered = false

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.has_node(Upgrade) and !hasEntered:
			
			hasEntered = true
			
			await get_tree().create_timer(0.5).timeout
			body.pause()
			
			var upgrade = body.get_node(Upgrade)
			body.remove_child(upgrade)
			
			await get_tree().create_timer(1).timeout
			body.resume()
