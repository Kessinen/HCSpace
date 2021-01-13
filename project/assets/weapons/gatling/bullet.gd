extends Area2D


export var speed: float = 400

export var damage: float = 1.0

func _enter_tree():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("bulletSound").play()
	
func _physics_process(delta):
	position.y -= speed * delta
	if position.y < 0:
		queue_free()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Gatling_area_entered(area):
	print(area.get_parent().damage(damage))
	queue_free()
	pass # Replace with function body.
