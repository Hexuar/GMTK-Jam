extends TextureRect

var transitionSpeed = 1000
var animate : bool = true

func _process(delta: float) -> void:
	if animate:
		position.y += transitionSpeed * delta
		if position.y > size.y:
			animate = false
	else:
		position.y = -size.y
