extends CharacterBody2D


@export var speed = 100.0
@export var jumpVelocity = -300.0

@onready var Wheel = get_node("Wheel/Sprite")

var inputEnabled = true

# Upgrades
var hasJetpack : bool = true
var hasRocketBoots : bool = true
var hasGrapplingHook : bool = true
var hasDrill : bool = true
var hasClimbingGear : bool = true


func _physics_process(delta: float) -> void:
	if inputEnabled: 
		handle_movement(delta)


func handle_movement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jumpVelocity
	
	# Jetpack
	if Input.is_action_pressed("Jump") and hasJetpack and !is_on_floor() and position.y > -256:
		velocity.y = jumpVelocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	# Wheel
	if is_on_floor():
		Wheel.rotation += velocity.x / 1000

	move_and_slide()
