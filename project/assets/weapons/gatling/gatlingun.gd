extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var rateoffire: float = 0.4

var plBullet := preload("res://assets/weapons/gatling/bullet.tscn")
onready var rofTimer := $rofTimer

export var energyRequired = 2

func _ready():
	pass

func fire(bulletPos = Vector2()):
	
	if Input.is_action_pressed("shoot") and rofTimer.is_stopped():
		rofTimer.start(rateoffire)
		var bullet := plBullet.instance()
		bullet.position = bulletPos
		get_tree().current_scene.add_child(bullet)

	pass
