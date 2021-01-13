extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bg = get_node("parallaxstars")
onready var bg2 = get_node("background")
var parallaxSpeed = 10.0
#bg.set_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	#var bgposition += Vector2(0,20.0*delta)
	#var bgposition = bg.get_position()
	bg.set_position(bg.get_position() + Vector2(0,parallaxSpeed*delta))
	#bg.set_position(Vector2(0,-20*20*delta))
	#print(delta)
	pass
