extends TextureRect

var transitionSpeed = 1000
var running : bool = true

func animate():
	position.y = -size.y
	running = true

signal animation_step
signal animation_finished


func _process(delta: float) -> void:
	if running:
		position.y += transitionSpeed * delta
		if position.y > -250:
			animation_step.emit()
		if position.y > size.y:
			running = false
			animation_finished.emit()
	else:
		position.y = -size.y
