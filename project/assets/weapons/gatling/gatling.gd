extends RigidBody2D

var BULLETSPEED = -800
var ROF = 0.4

func _enter_tree():
	global.ROF = ROF
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	
	apply_impulse(Vector2(),Vector2(0,BULLETSPEED))
	
	
	

func _physics_process(delta):
	
	if self.position.y < 0:
		self.queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
