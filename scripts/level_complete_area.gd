extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.inputEnabled = false
		$AnimatedSprite2D.play()
		
		await get_tree().create_timer(3).timeout
		
		var world = get_parent().get_parent()
		world.load_level(2)
		body.inputEnabled = true
