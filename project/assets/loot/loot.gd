extends KinematicBody2D

export var cargoSize = 1
export var money = 1
var velocity = Vector2.DOWN
var playerInArea = false

func _ready():
	pass
	
func _physics_process(delta):
	if playerInArea:
		var playerPos = global.playerPosition
		velocity = velocity.move_toward(playerPos - position, 0.1)
	move_and_collide(velocity * delta * 100)

func attract(inArea : bool):
	playerInArea = inArea
	
func playerGotMe():
	queue_free()
