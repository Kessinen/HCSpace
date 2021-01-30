extends KinematicBody2D

class_name shipsBase

export var shipModel: String
export var maxHP: float 
export var maxShields: float 
export var maxEnergy: float 
export var shipSpeed: float 
export var shipAcceleration: float 
export var maxCargo: float 
export var shieldRegenSpeed: float 
export var shieldRegenAmount: float 
export var energyRegenSpeed: float 
export var energyRegenAmount: float 

var rechargeShieldsTimer := Timer.new()
var rechargeEnergyTimer := Timer.new()

var curShield: float = 0
var curHP: float = 0
var curEnergy: float = 0
var curCargo: float = 0

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	rechargeShields()
	rechargeEnergy()
	move()

func initShip():
	curHP = maxHP
	curShield = maxShields
	curEnergy = maxEnergy

func move():
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction = direction.normalized()
	
	if direction == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, shipAcceleration)
	else:
		velocity = velocity.move_toward(direction * shipSpeed, shipAcceleration)
	velocity = move_and_slide(velocity)
	get_node("/root/global").playerPosition = position

func rechargeShields():
	if rechargeShieldsTimer.is_stopped() and curShield < maxShields:
		rechargeShieldsTimer.start(shieldRegenSpeed)
		curShield += shieldRegenAmount
		curShield = clamp(curShield, 0, maxShields)

func rechargeEnergy():
	if rechargeEnergyTimer.is_stopped() and curEnergy < maxEnergy:
		rechargeEnergyTimer.start(energyRegenSpeed)
		curEnergy += energyRegenAmount
		curEnergy = clamp(curEnergy, 0, maxEnergy)
		
func damage(amount: float):
	if curShield > amount:
		curShield -= amount
	else:
		curHP -= amount - curShield
		curShield = 0
	if curHP <= 0:
		die()

func die():
	queue_free()
