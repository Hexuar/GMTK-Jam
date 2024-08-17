extends Node2D

var currentLevel
var levelScale = 1.0

var Player : CharacterBody2D

func load_level(index):
	if currentLevel: currentLevel.queue_free()
	
	var scene = load("res://scenes/levels/level%s.tscn" % index)
	currentLevel = scene.instantiate()
	add_child(currentLevel)

func _ready() -> void:
	load_level(1)


func _process(_delta: float) -> void:
	currentLevel.scale = Vector2(levelScale, levelScale)
