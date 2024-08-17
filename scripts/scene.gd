extends Node2D

@export var index : int
@export var levelScale : float = 1

func _ready() -> void:
	scale = Vector2(levelScale,levelScale)
	print("Loaded Level %s" % index)
