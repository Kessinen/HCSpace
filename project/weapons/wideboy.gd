extends weaponsBase

export var numOfBullets : int = 5
export var spreadOfBullets : float
export var bulletLifetime : int = 3

var bullets : Array
var bulletLifeTimer := Timer.new()

func _physics_process(delta):
	pass

func _ready():
	createBullets()

func createBullets():
	for i in range(numOfBullets):
		randomize()
		var bulletAngle = rand_range(spreadOfBullets / 2 *-1, spreadOfBullets / 2)
		var tmpBullet = $bullet.duplicate()
		
		tmpBullet.position = global.playerPosition
		tmpBullet.position.x = get_node("/root/global").playerPosition.x - (10*i)
		tmpBullet.rotation = bulletAngle
		tmpBullet.set_linear_velocity(Vector2(cos(bulletAngle), sin(bulletAngle))*100)
		#tmpBullet.apply_central_impulse(Vector2(bulletAngle, bulletAngle) * 10)
		#tmpBullet.apply_impulse(Vector2.ZERO,tmpBullet.rotation*bulletSpeed)
		get_parent().add_child(tmpBullet)
		bullets.append($bullet.duplicate())
	$bullet.queue_free()
