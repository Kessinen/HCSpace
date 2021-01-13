extends RigidBody2D

var BULLETSPEED = -800
var ROF = 0.4
var DAMAGE = 1

func _enter_tree():
	global.ROF = ROF
	global.DANAGE = DAMAGE
	


# Called when the node enters the scene tree for the first time.
func _ready():
	
	apply_impulse(Vector2(),Vector2(0,BULLETSPEED))
	get_node("AudioStreamPlayer").play()
	
	
	

func _physics_process(delta):
	
	if self.position.y < BULLETSPEED / 2:
		self.queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
