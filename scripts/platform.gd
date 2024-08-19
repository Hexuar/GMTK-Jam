extends StaticBody2D

@export var scaleFactor : Vector2 = Vector2(0.5, 0.5)
@export var scaleCooldown : float = 2.0
#@export var timeOffset : float = 0.0

var time = scaleCooldown #+ timeOffset
var factor : Vector2 = Vector2.ONE
var scaleTarget : Vector2 = Vector2.ONE

func _process(delta: float) -> void:
	time -= delta
	if time < 0.0:
		time = 10000
		scaleTarget = scaleFactor
		await get_tree().create_timer(scaleCooldown).timeout
		scaleTarget = Vector2.ONE
		time = scaleCooldown
	
	factor = lerp(factor, scaleTarget, delta * 5)
	scale = factor
