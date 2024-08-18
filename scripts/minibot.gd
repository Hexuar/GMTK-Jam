extends Node2D

@export_multiline var text : Array[String]

@onready var SpeechBubble = $SpeechBubble
@onready var UIBot = get_parent().get_parent().get_node("UI/Minibot")
@onready var Vignette = get_parent().get_parent().get_node("UI/Vignette")
@onready var Sound = $Sound

var Player : CharacterBody2D
var textPosition = 0
var speed : float

signal minibot_done

func start_chat():
	Sound.play()
	Player.pause()
	UIBot.visible = true
	Vignette.material.set_shader_parameter("softness",1.0)

func stop_chat():
	Sound.stop()
	Player.resume()
	UIBot.visible = false
	SpeechBubble.visible = false
	speed = -60.0
	Vignette.material.set_shader_parameter("softness",1.5)
	minibot_done.emit()

func _process(delta: float) -> void:
	position.y += speed * delta
	if Input.is_action_just_pressed("ui_accept") and SpeechBubble.visible:
		if textPosition >= text.size():
			stop_chat()
			return
		if textPosition == 0:
			start_chat()
		UIBot.get_node("Speech Bubble/Text").text = "[color=\"black\"]%s[/color]" % text[textPosition]
		textPosition += 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and textPosition < text.size():
		Player = body
		body.canJump = false
		SpeechBubble.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		stop_chat()
		body.canJump = true
		SpeechBubble.visible = false
