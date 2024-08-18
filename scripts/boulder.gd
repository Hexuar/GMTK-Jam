extends RigidBody2D

var spawnLocation : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnLocation = position * owner.scale

func reset():
	linear_velocity = Vector2()
	angular_velocity = randf_range(0,PI)
	PhysicsServer2D.body_set_state(
		get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(spawnLocation)
	)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if position.y > 1000:
		reset()
