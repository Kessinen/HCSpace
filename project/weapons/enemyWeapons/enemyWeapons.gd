extends RigidBody2D

onready var playerPosition = get_node("/root/global").playerPosition
export var bulletSpeed = 200
export var bulletDamage = 1

func _ready():
	apply_impulse(Vector2(),Vector2(bulletSpeed,0).rotated(get_angle_to(playerPosition)))
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_EnemyBulletArea_area_entered(area):
	var target = area.get_parent()
	if target.get_name() == "ship":
		target.damage(bulletDamage)
		queue_free()
		pass

func _on_EnemyBulletArea_body_entered(body):
	if body.is_in_group("players"):
		body.damage(bulletDamage)
		queue_free()
