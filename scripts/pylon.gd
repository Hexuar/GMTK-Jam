extends Area2D

@export var goToLevel : int

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.pause()
		$AnimatedSprite2D.play()
		
		await get_tree().create_timer(1).timeout
		
		var world = get_parent().get_parent()
		world.load_level(goToLevel)
		body.position = body.spawnLocation
		body.resume()
