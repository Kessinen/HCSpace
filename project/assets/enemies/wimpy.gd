extends KinematicBody2D

var velocity = Vector2.ZERO
var MAXSPEED = 1
var ACCELERATION = 100
var canFire = true
export var life := 20
export var rof = 5
export var minLoot = 1
export var maxLoot = 5
var randomPoint = Vector2.ZERO
onready var plBullet := preload("res://assets/weapons/enemyWeapons/enemyWeapons.tscn")
onready var plLoot := preload("res://assets/loot/loot.tscn")
onready var fireDelay := $fireDelay

func _ready():
	pass

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


func damage(amount : float):
	life -= amount
	if life <= 0:
		var loot = plLoot.instance()
		loot.position = get_global_position()
		loot.money = round(rand_range(minLoot,maxLoot))
		print(loot.money)
		get_parent().add_child(loot)
		queue_free()

func _on_Area2D_area_entered(area):
	pass
