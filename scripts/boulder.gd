extends RigidBody2D

var spawnLocation : Vector2
@export var lifeTime : int = 2
var time


func _ready() -> void:
	spawnLocation = position * owner.scale
	reset()


func reset():
	time = lifeTime
	linear_velocity = Vector2()
	angular_velocity = 10.0
	PhysicsServer2D.body_set_state(
		get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(spawnLocation)
	)


func _physics_process(delta: float) -> void:
	time -= delta
	if time < 0.0:
		reset()
