extends KinematicBody2D


var WEAPON = "gatling"
var GUN = preload("res://assets/weapons/gatling/gatlingun.tscn")
onready var canFire = GUN.instance()
onready var ship := $ship

var velocity = Vector2.ZERO
var MAXSPEED = 300.0
var ACCELERATION = 20
var FRICTION = 1.0
export var hitpoints = 20
export var shields = 20

func _ready():
	
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("shoot"):
		add_child(canFire)
		var gun = $canFire 
		canFire.fire(self.get_global_position())
		pass

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		
		velocity = velocity.move_toward(input_vector * MAXSPEED, ACCELERATION)

	else:
		velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION)


	velocity = move_and_slide(velocity)
	get_node("/root/global").playerPosition = self.get_global_position()
		
func damage(damage : float):
	if shields < damage:
		var difference = shields - damage
		shields = 0
		hitpoints -= damage
		if hitpoints <= 0:
			queue_free()
	else:
		shields -= damage
	pass
