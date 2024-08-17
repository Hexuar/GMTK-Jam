extends Node2D

@export_multiline var text : String

@onready var SpeechBubble = $SpeechBubble


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump") and SpeechBubble.visible:
		print(text)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.canJump = false
		SpeechBubble.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.canJump = true
		SpeechBubble.visible = false
