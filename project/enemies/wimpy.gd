extends enemiesBase

var randomPoint = Vector2.ZERO

var plew1 = preload("res://weapons/enemyWeapons/ew-1.tscn")

func _ready():
	pass

func _physics_process(delta):
	if randomPoint == Vector2.ZERO or get_position().distance_to(randomPoint) < 10:
		randomPoint = get_random_point()
	move_to_point(randomPoint)
	fire()
	

func get_random_point() -> Vector2:
	randomize()
	var newPoint := Vector2(rand_range(10,950),rand_range(10, 500))
	return newPoint

func fire():
	var bullet = plew1.instance()
	bullet.position = $gunPosition.get_global_position()
	fireGuns(bullet)
	pass
		
