extends KinematicBody2D

class_name enemiesBase

export var hitPoints: float
export var rateOfFire: float
export var shield: float
export var speed: float
export var acceleration: float = 1000
export var minLoot: float = 1
export var maxLoot: float = 1
export var rechargeShield: float
export var damage: float = 1

onready var plLoot := preload("res://loot/loot.tscn")
var shieldRechargeTimer = Timer.new()
var rofTimer = Timer.new()
var curShield: float
var curHitPoints: float
var velocity := Vector2.ZERO
var moveToTarget = Vector2.ZERO

func _ready():
	shieldRechargeTimer.one_shot = true
	rofTimer. one_shot = true
	add_child(shieldRechargeTimer)
	add_child(rofTimer)

func _physics_process(delta):
	if curShield < shield and shieldRechargeTimer.is_stopped():
		shieldRechargeTimer.start(rechargeShield)

func fireGuns(bullet):
	if rofTimer.is_stopped():
		rofTimer.start(rateOfFire)
		get_parent().add_child(bullet)

func move_to_point(target: Vector2):
	var direction = (target - position).normalized()
	moveToTarget = moveToTarget.move_toward(direction * speed,acceleration)
	moveToTarget = move_and_slide(moveToTarget)

func damage(amount):
	if amount > curShield:
		curHitPoints -=  amount - curShield
		curShield = 0
	else:
		curShield -= amount
	if curHitPoints <= 0:
		die()

func die():
	randomize()
	var reward = plLoot.instance()
	reward.init(rand_range(minLoot,maxLoot), position)
	get_parent().add_child(reward)
	queue_free()
