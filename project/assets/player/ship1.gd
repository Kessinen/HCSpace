extends KinematicBody2D

var velocity = Vector2.ZERO
var MAXSPEED = 5.0
var ACCELERATION = 10.0
var FRICTION = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAXSPEED)
		#velocity = velocity.move_toward(input_vector * MAXSPEED, ACCELERATION)

	else:
		velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION*delta)
		

	
	move_and_collide(velocity)
