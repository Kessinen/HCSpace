extends weaponsBase

export var numOfBullets : int = 5
export var spreadOfBullets : float
export var bulletLifetime : float = 3

var bulletLifeTimer := Timer.new()

func _physics_process(delta):
	pass

func _ready():
	createBullets()

func createBullets():
	for i in range(numOfBullets):
		randomize()
		var bulletAngle = deg2rad(rand_range(spreadOfBullets / 2 *-1, spreadOfBullets / 2)-90)
		var tmpBullet = $bullet.duplicate()
		bulletLifeTimer.set_wait_time(bulletLifetime)
		bulletLifeTimer.connect("timeout",tmpBullet,"queue_free")
		tmpBullet.add_child(bulletLifeTimer)
		bulletLifeTimer.start()
		tmpBullet.position = global.playerPosition
		tmpBullet.position.y += rand_range(0,20)
		
		tmpBullet.apply_impulse(Vector2(), Vector2(bulletSpeed,0).rotated(bulletAngle))
		get_parent().add_child(tmpBullet)
	$bullet.queue_free()


func _on_damageDetector_body_entered(body):
	print(body.get_name())


func _on_Area2D_body_entered(body):
	body.damage(damage)
	queue_free()
