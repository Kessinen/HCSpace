extends Node2D


var WEAPON = "gatling"
var GUN = preload("res://assets/weapons/gatling/gatlingun.tscn")
onready var canFire = GUN.instance()
onready var ship := $ship1

func _ready():
	
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("shoot"):
		add_child(canFire)
		var gun = $canFire 
		canFire.fire(ship.get_global_position())
		pass
		
	
