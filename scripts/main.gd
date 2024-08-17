extends Node2D

@export var Menu : PackedScene
var menu

var currentLevelIndex : int
var currentLevel : Node2D
var levelScale : float = 1.0

@onready var Player = $Player

func _ready() -> void:
	open_menu()
	load_level()

func open_menu():
	get_tree().paused = true
	menu = Menu.instantiate()
	add_child(menu)

func load_level(index = 0):
	if currentLevel: currentLevel.queue_free()
	
	var scene = load("res://scenes/levels/level%s.tscn" % index)
	currentLevel = scene.instantiate()
	currentLevelIndex = index
	
	levelScale -= float(currentLevelIndex) / 10
	currentLevel.scale = Vector2(levelScale, levelScale)
	
	add_child(currentLevel)
	
	Player.position = currentLevel.get_node("SpawnLocation").position * levelScale
