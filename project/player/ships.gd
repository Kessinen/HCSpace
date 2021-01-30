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
export var shieldRegenAmount: float = 1
export var shieldRegenCost: float = 1
export var energyRegenSpeed: float 
export var energyRegenAmount: float = 1
export var lootingRange: float = 70

var rechargeShieldsTimer := Timer.new()
var rechargeEnergyTimer := Timer.new()

var curShield: float = 0
var curHP: float = 0
var curEnergy: float = 0
var curCargo: float = 0
var curLootValue: float = 0

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func _ready():
	var hud = get_parent().get_node("HUD")
	hud.initBars(maxHP, maxShields, maxEnergy)

func _physics_process(delta):
	rechargeShields()
	rechargeEnergy()
	move()
	updateHUD()

func initStats():
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
	if rechargeShieldsTimer.is_stopped() and curShield < maxShields and curEnergy > shieldRegenCost:
		curEnergy -= shieldRegenCost
		rechargeShieldsTimer.start(shieldRegenSpeed)
		curShield += shieldRegenAmount
		curShield = clamp(curShield, 0, maxShields)

func rechargeEnergy():
	if rechargeEnergyTimer.is_stopped() and curEnergy < maxEnergy:
		rechargeEnergyTimer.start(energyRegenSpeed)
		curEnergy += energyRegenAmount
		curEnergy = clamp(curEnergy, 0, maxEnergy)

func updateCargo(lootSize: float, lootValue: float) -> bool:
	var cargoSpaceLeft = maxCargo - curCargo
	if lootSize < cargoSpaceLeft:
		curCargo += lootSize
		curLootValue += lootValue
		return true
	return false

func updateHUD():
	var hud = get_parent().get_node("HUD")
	hud.updateLoot(curLootValue)
	hud.updateBars(curHP, curShield, curEnergy)
	pass

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
