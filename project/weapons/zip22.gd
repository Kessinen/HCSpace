extends weaponsBase

var velocity : Vector2

func _physics_process(delta):
	velocity = Vector2(0,bulletSpeed * -1)
	var testi = move_and_collide(velocity * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_hitDetection_body_entered(body):
	if body.is_in_group("enemies"):
		body.damage(damage)
		queue_free()
