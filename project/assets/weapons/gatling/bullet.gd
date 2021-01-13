extends Area2D


export var speed: float = 400

export var damage: float = 2.0

func _enter_tree():
	pass

func _ready():
	get_node("bulletSound").play()
	
func _physics_process(delta):
	position.y -= speed * delta
	if position.y < 0:
		queue_free()
	
func _on_Gatling_area_entered(area):
	area.get_parent().damage(damage)
	queue_free()
