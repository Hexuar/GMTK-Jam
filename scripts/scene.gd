extends Node

@export var index : int
@export var levelScale : float = 1

@onready var tileMapLayer = $TileMapLayer

func _ready() -> void:
	tileMapLayer.scale = Vector2(levelScale,levelScale)
	print("Loaded Level %s" % index)
