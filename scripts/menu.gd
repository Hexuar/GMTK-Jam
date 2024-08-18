extends CanvasLayer

@onready var StartButton = $Buttons/StartButton

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		StartButton.pressed.emit()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
