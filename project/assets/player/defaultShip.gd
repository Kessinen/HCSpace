extends Node2D


var WEAPON = "gatling"
var GUN = preload("res://assets/weapons/gatling/gatling.tscn")
var canFire = true

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("shoot") and canFire == true:
		
		canFire = false
		var bullet_instance = GUN.instance()
		
		bullet_instance.position = get_node("ship1").get_global_position() + Vector2(0,-50)
		get_parent().add_child(bullet_instance)
		var ROF = global.ROF
		yield(get_tree().create_timer(ROF),"timeout")
		canFire = true
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
