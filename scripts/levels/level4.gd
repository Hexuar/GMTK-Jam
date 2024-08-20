extends Node2D

@onready var PylonSprite = $Pylon/Sprite2D

var triggeredEnding = false

func remove_entities():
	$Boulders.queue_free()
	$Platforms.queue_free()
	$Kill.queue_free()
	$Snow.queue_free()

func _on_pylon_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and !triggeredEnding:
		triggeredEnding = true
		PylonSprite.play()
		
		await PylonSprite.animation_finished
		remove_entities()
		
		var world = get_node("/root/Main")
		var scene = load("res://scenes/levels/level5.tscn")
		world.add_child(scene.instantiate())
		
		world.GlitchSound.play()
		world.Music.stop()
		world.defaultLevelScale = 0.006
		world.levelScaleTarget = world.defaultLevelScale
		world.currentLevelIndex = 0
