extends Area2D

@export var goToLevel : int

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.pause()
		$AnimatedSprite2D.play()
		
		var world = get_node("/root/Main")
		
		world.Menu.transition()
		await world.Menu.animation_step
		world.load_level(goToLevel)
		
		body.resume()
		
