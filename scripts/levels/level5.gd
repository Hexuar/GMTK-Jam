extends Node2D

@onready var Stats = get_node("/root/Main/UI/Stats")

func _ready() -> void:
	Stats.timerPaused = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.pause()
		
		var world = get_node("/root/Main")
		
		world.Menu.end_screen()
		await world.Menu.animation_step
		get_tree().paused = true
		world.load_level(0)
		world.Music.play()
		
		body.resume()
		world.deaths = 0
		Stats.timePlayed = 0
		Stats.timerPaused = false
		queue_free()
