extends CanvasLayer

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS

func _on_start_button_pressed() -> void:
	queue_free()
	get_tree().paused = false
