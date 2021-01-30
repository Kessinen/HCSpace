extends RigidBody2D

var playerPosition = Vector2.ZERO
export var bulletSpeed = 200
export var bulletDamage = 1


func _ready():
	playerPosition = get_node("/root/global").playerPosition 
	apply_impulse(Vector2(),Vector2(bulletSpeed,0).rotated(get_angle_to(playerPosition)))
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	

func _on_EnemyBulletArea_area_entered(area):
	var target = area.get_parent()
	if target.get_name() == "ship":
		target.damage(bulletDamage)
		queue_free()
		pass
