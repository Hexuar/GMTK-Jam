extends Node2D

@export var startLevel : int = 0
@export var glitchFrequency : int = 30
@export var glitchLength : int = 10

@onready var Music = $Music
@onready var Menu = $UI/Menu
@onready var GlitchSound = $Glitch

const defaultMusic = preload("res://assets/music.wav")
const glitchMusic = preload("res://assets/glitch_music.wav")

var currentLevel : Node2D
var currentLevelIndex : int
var levelScaleTarget: float = 1.0
var levelScale: float = 1.0
var defaultLevelScale : float = 1.0

var deaths = 0

func _ready() -> void:
	# Menu
	Menu.Music = Music
	Menu.get_node("Buttons/StartButton").pressed.connect(close_menu)
	get_tree().paused = true
	
	# Start Game
	load_level(startLevel)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		open_menu()
	if !randi_range(0, int(glitchFrequency/delta) - currentLevelIndex) and currentLevelIndex != 0:
		glitch()
	levelScale = lerp(levelScale, levelScaleTarget, 0.1)
	scale_level(levelScale)

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
	
	# Scale
	defaultLevelScale = 1.0 - index * 0.1
	levelScaleTarget = defaultLevelScale
	add_child(currentLevel)


func scale_level(factor):
	currentLevel.scale = Vector2(factor, factor)
	currentLevel.get_node("Player").scale = Vector2.ONE/currentLevel.scale


func glitch():
	var factor = randf_range(-0.2 + currentLevelIndex * 0.1, 0.2 + currentLevelIndex * 0.1)
	var time = glitchLength + currentLevelIndex
	
	# Sound
	GlitchSound.play()
	Music.stream = glitchMusic
	Music.play()
	
	levelScaleTarget = 1 + factor
	await get_tree().create_timer(time).timeout
	levelScaleTarget = defaultLevelScale
	
	# Sound
	Music.stream = defaultMusic
	if(!Music.playing): 
		Music.play()
