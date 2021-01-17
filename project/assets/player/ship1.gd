extends KinematicBody2D

var WEAPON = "gatling"
var GUN = preload("res://assets/weapons/gatling/gatlingun.tscn")
onready var canFire = GUN.instance()
onready var ship := $ship
var velocity = Vector2.ZERO

var MAXSPEED = 300.0
var ACCELERATION = 20
export var maxhitpoints = 20
export var maxshields = 20
export var maxenergy = 200
var hitpoints = maxhitpoints
var shields = maxshields
var energy = maxenergy
var shieldRecharge = 5
var energyRecharge = 0.1
var shieldRechargeCost = 5

onready var hpBar := get_tree().get_root().find_node("hpBar", true, false)
onready var shieldsBar := get_tree().get_root().find_node("shieldsBar", true, false)
onready var energyBar := get_tree().get_root().find_node("energyBar", true, false)
onready var shieldRechargeTimer = $shieldRecharge
onready var energyRechargeTimer = $energyRecharge

func _ready():
	hpBar.max_value = hitpoints
	hpBar.value = hitpoints
	shieldsBar.max_value = shields
	shieldsBar.value = shields
	energyBar.max_value = energy
	energyBar.value = energy
	shieldRechargeTimer.wait_time = shieldRecharge
	shieldRechargeTimer.start()
	energyRechargeTimer.wait_time = energyRecharge
	energyRechargeTimer.start()

func _process(delta):
	if Input.is_action_pressed("shoot") and energy > 0:
		add_child(canFire)
		var gun = $canFire 
		canFire.fire(self.get_global_position())
		energy -= 1
		energyBar.value = energy

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
	hpBar.value = hitpoints
	shieldsBar.value = shields

func _on_shieldRecharge_timeout():
	if shields < maxshields and energy >= shieldRechargeCost:
		shieldsBar.value += 1
		shields +=1
		energyBar.value -= shieldRechargeCost
		energy -= shieldRechargeCost

func _on_energyRecharge_timeout():
	if energy < maxenergy:
		energyBar.value += 1
		energy +=1
