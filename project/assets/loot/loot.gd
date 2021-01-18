extends KinematicBody2D

export var cargoSize = 1
export var coinSpeed = 100
var money = 1
var attractForce = 0.1
var velocity = Vector2.DOWN
var playerInArea = false


func _ready():
	if money in range(1,10):
		$AnimationPlayer.play("bronze")
	elif money in range(10,99):
		$AnimationPlayer.play("silver")
	else:
		$AnimationPlayer.play("gold")
	
func _physics_process(delta):
	if playerInArea:
		var playerPos = global.playerPosition
		velocity = velocity.move_toward(playerPos - position, attractForce)
	move_and_collide(velocity * delta * coinSpeed)

func attract(inArea : bool):
	playerInArea = inArea
	
func playerGotMe():
	queue_free()

func _exit_tree():
	get_parent().isLevelComplete()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
