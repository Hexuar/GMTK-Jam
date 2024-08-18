extends Node2D

@export var startLevel : int = 0

@onready var Menu = $UI/Menu

var currentLevelIndex : int
var currentLevel : Node2D

func _ready() -> void:
	Menu.Music = $Music
	Menu.get_node("Buttons/StartButton").pressed.connect(close_menu)
	get_tree().paused = true
	load_level(startLevel)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		open_menu()

func open_menu():
	Menu.open()
	await Menu.animation_step
	get_tree().paused = true

func close_menu():
	get_tree().paused = false

func load_level(index):
	if currentLevel: currentLevel.queue_free()
	
	var scene = load("res://scenes/levels/level%s.tscn" % index)
	currentLevel = scene.instantiate()
	currentLevelIndex = index
	
	currentLevel.get_node("Player").scale = Vector2.ONE/currentLevel.scale
	
	add_child(currentLevel)
