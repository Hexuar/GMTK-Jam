extends Sprite2D

@export var scaleFactor : float = 0.5
@export var scaleCooldown = 5
var time = scaleCooldown
var factor : float = 1.0
var scaleTarget : float = 1.0

func _process(delta: float) -> void:
	time -= delta
	if time < 0.0:
		time = 10000
		scaleTarget = scaleFactor
		await get_tree().create_timer(scaleCooldown).timeout
		scaleTarget = 1.0
		time = scaleCooldown
	
	factor = lerp(factor, scaleTarget, delta * 5)
	scale = Vector2(factor,factor)
