extends CharacterBody2D


@export var speed = 200.0
@export var jumpVelocity = -300.0
@export var dashModifier = 5
@export var dashLength = 0.15 # Seconds
@export var dashCooldown = 0.5 # Seconds
@export var friction = 0.05
@export var coyoteTime = 0.1 # Seconds

@onready var Bot = get_node("Bot/Sprite2D")
@onready var Wheel = get_node("Wheel/Sprite2D")
@onready var Jetpack = get_node("Jetpack/Sprite2D")


var hasJetpack : bool = false
var hasWheel : bool = true

var inputEnabled : bool = true

var dashTime : float = 0.0
var floorCooldown : float = 0.0
var _speed


func _physics_process(delta: float) -> void:
	if inputEnabled: 
		handle_movement(delta)


func handle_movement(delta):
	## Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	## Coyote Time
	if floorCooldown > 0.0:
		floorCooldown -= delta
	if is_on_floor():
		floorCooldown = coyoteTime
	
	
	## Jump
	if Input.is_action_just_pressed("Jump") and floorCooldown > 0.0:
		velocity.y = jumpVelocity
	
	
	## Jetpack
	Jetpack.frame = 0
	if Input.is_action_pressed("Jump") and hasJetpack and !floorCooldown > 0.0 and position.y > -256:
		velocity.y = jumpVelocity
		Jetpack.frame = 1
	
	
	## Boost
	print(dashTime)
	if dashTime > -dashCooldown:
		dashTime -= delta
	if dashTime < 0.0 and is_on_floor():
		dashTime = -dashCooldown
	if dashTime > 0.0 :
		_speed = move_toward(_speed, speed * dashModifier, 100)
	else:
		_speed = speed
	if Input.is_action_just_pressed("Dash") and hasWheel and dashTime <= -dashCooldown:
		dashTime = dashLength	
	
	
	## Input
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * _speed
	else:
		velocity.x = move_toward(velocity.x, 0, _speed*friction)

	
	## Animation
	Bot.frame = direction+1
	Wheel.rotation += velocity.x / 1000
	
	
	move_and_slide()
