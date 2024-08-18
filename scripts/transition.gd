extends TextureRect

var transitionSpeed = 1000
var running : bool = true
var Music : AudioStreamPlayer

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
			Music.volume_db += 0.1
		else:
			Music.volume_db -= 0.15 # Horrible code, but I don't have time
		if position.y > size.y:
			running = false
			animation_finished.emit()
	else:
		position.y = -size.y
		Music.volume_db = 0.0
