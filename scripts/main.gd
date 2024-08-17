extends Node2D

var currentLevel

@onready var Player = $Player

func load_level(index):
	if currentLevel: currentLevel.queue_free()
	
	var scene = load("res://scenes/levels/level%s.tscn" % index)
	currentLevel = scene.instantiate()
	add_child(currentLevel)
	
	Player.position = Vector2()

func _ready() -> void:
	load_level(1)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Increment Level") && currentLevel.index != 2:
		load_level(2)
