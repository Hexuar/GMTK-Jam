extends Area2D

@export var goToLevel : int

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.pause()
		$AnimatedSprite2D.play()
		
		var world = get_parent().get_parent()
		world.get_node("UI/Transition").animate()
		
		await get_tree().create_timer(1.2).timeout
		world.load_level(goToLevel)
		
		body.resume()
