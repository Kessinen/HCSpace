extends enemiesBase

var randomPoint = Vector2.ZERO



func _ready():
	pass

func _physics_process(delta):
	if randomPoint == Vector2.ZERO or get_position().distance_to(randomPoint) < 10:
		randomPoint = get_random_point()
	move_to_point(randomPoint)
	

func get_random_point() -> Vector2:
	randomize()
	var newPoint := Vector2(rand_range(10,950),rand_range(10, 500))
	return newPoint

func fire():
	var ownPosition = get_global_position()
	var playerPosition = get_node("/root/global").playerPosition
	var playerDirection = playerPosition - ownPosition
