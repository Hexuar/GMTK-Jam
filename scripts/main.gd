extends Node2D

@export var startLevel : int = 0
@export var Menu : PackedScene
var menu

var currentLevelIndex : int
var currentLevel : Node2D

@onready var Transition = $UI/Transition

func _ready() -> void:
	Transition.Music = $Music
	open_menu()
	load_level(startLevel)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		Transition.animate()
		await Transition.animation_step
		open_menu()

func open_menu():
	get_tree().paused = true
	menu = Menu.instantiate()
	menu.get_node("Buttons/StartButton").pressed.connect(close_menu)
	add_child(menu)

func close_menu():
	get_tree().paused = false
	menu.queue_free()

func load_level(index):
	if currentLevel: currentLevel.queue_free()
	
	var scene = load("res://scenes/levels/level%s.tscn" % index)
	currentLevel = scene.instantiate()
	currentLevelIndex = index
	
	add_child(currentLevel)
