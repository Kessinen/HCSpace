extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bg2 = get_node("background")
var plEnemy := preload("res://assets/enemies/wimpy.tscn")
var parallaxSpeed = 10.0
onready var newEnemy := $enemyTimer
#bg.set_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(50):
		var enemies = plEnemy.instance()
		enemies.set_position(Vector2(rand_range(0,900),-50))
		yield(get_tree().create_timer(0.5), "timeout")
		add_child(enemies)
	
	pass # Replace with function body.

func _physics_process(delta):
	
	
		
	if newEnemy.is_stopped():
		newEnemy.start(2)
		
		#enemies = plEnemy.instance()
		#add_child(enemies)
		#add_child(enemies)
		#add_child(enemies)
	pass
