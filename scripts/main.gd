extends Node2D

var currentLevelIndex : int
var currentLevel : Node2D
var levelScale : float = 1.0

@onready var Player = $Player

func load_level(index):
	if currentLevel: currentLevel.queue_free()
	
	var scene = load("res://scenes/levels/level%s.tscn" % index)
	currentLevel = scene.instantiate()
	currentLevelIndex = index
	levelScale -= float(currentLevelIndex) / 10
	
	add_child(currentLevel)
	
	Player.position = currentLevel.get_node("SpawnLocation").position * levelScale

func _ready() -> void:
	load_level(0)


func _process(_delta: float) -> void:
	currentLevel.scale = Vector2(levelScale, levelScale)
