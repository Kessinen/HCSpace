extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO
var MAXSPEED = 1
var ACCELERATION = 100
var canFire = true
export var life := 20
export var rof = 5
var randomPoint = Vector2.ZERO
onready var plBullet := preload("res://assets/weapons/enemyWeapons/enemyWeapons.tscn")
onready var fireDelay := $fireDelay


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	
	# Movement
	if randomPoint == Vector2.ZERO:
		randomPoint = Vector2(rand_range(20,950),rand_range(20,500))
	elif get_position().distance_to(randomPoint) < 10:
		randomPoint = Vector2(rand_range(20,950),rand_range(20,500))	
	var direction = randomPoint - get_position()
	direction = direction.normalized() * MAXSPEED
	velocity = velocity.move_toward(direction,ACCELERATION*delta)
	move_and_collide(velocity)
	if fireDelay.is_stopped():
		fireDelay.start(rof)
		fire()
	
func fire():
	var ownPosition = get_global_position()
	var playerPosition = get_node("/root/global").playerPosition
	var playerDirection = playerPosition - ownPosition
	
	var bullet = plBullet.instance()
	bullet.position = ownPosition
	bullet.bulletSpeed = 200
	get_parent().add_child(bullet)
	pass


func damage(amount : float):
	life -= amount
	if life <= 0:
		queue_free()

func _on_Area2D_area_entered(area):
	pass
