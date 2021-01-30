extends KinematicBody2D

export var lootSize: int = 1
export var coinSpeed: float = 100
export var attractForce: float = 10
var lootValue: int
var target
var velocity : Vector2
var direction : Vector2 = Vector2.DOWN

func _ready():
	if lootValue < 10:
		$AnimationPlayer.play("bronze")
	elif lootValue < 100:
		$AnimationPlayer.play("silver")
	else:
		$AnimationPlayer.play("gold")
	
func _physics_process(delta):
	move()

func init(lValue: int, spawnPosition : Vector2):
	lootValue = lValue
	position = spawnPosition

func move():
	if target or target != null:
		direction = target.position - position
	direction = direction.normalized()
	velocity = velocity.move_toward(direction * coinSpeed, attractForce)
	
	velocity = move_and_slide(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_playerSearch_body_entered(body):
	if body.is_in_group("players"):
		if body.updateCargo(lootSize, lootValue):
			queue_free()
