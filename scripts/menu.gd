extends TextureRect

var transitionSpeed = 1000
var running : bool = true
var Music : AudioStreamPlayer

signal animation_step
signal animation_finished

@onready var StartButton = $Buttons/StartButton
@onready var Buttons = $Buttons
@onready var Title = $Title
@onready var Credits = $Credits

func _on_exit_button_pressed() -> void:
	get_tree().quit()
	
	
func open():
	Buttons.visible = true
	Title.visible = true
	Credits.visible = true
	position.y = -size.y
	running = true

func transition():
	Buttons.visible = false
	Title.visible = false
	Credits.visible = false
	position.y = -size.y
	running = true


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		StartButton.pressed.emit()
	if running:
		position.y += transitionSpeed * delta
		if position.y > -250:
			animation_step.emit()
			Music.volume_db += 0.1
		else:
			Music.volume_db -= 0.15 # Horrible code, but I don't have time
		if position.y > size.y:
			running = false
			animation_finished.emit()
	else:
		position.y = -size.y
		Music.volume_db = 0.0
