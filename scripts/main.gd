extends Node2D

var currentLevel
var levelScale = 1.0

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
	currentLevel.scale = Vector2(levelScale, levelScale)
