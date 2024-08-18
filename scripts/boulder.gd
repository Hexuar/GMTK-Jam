extends RigidBody2D

var spawnLocation : Vector2
@export var lifeTime : int = 2

var time

# Called when the node enters the scene tree for the first time.
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	time -= delta
	if time < 0.0:
		reset()
