extends shipsBase

var plZip22 = preload("res://weapons/zip22.tscn")
var rofTimer = Timer.new()


func _ready():
	rofTimer.one_shot = true
	add_child(rofTimer)
	initShip()

func _physics_process(delta):
	pass

func _unhandled_input(event):
	if Input.is_action_pressed("shoot") and rofTimer.is_stopped():
		var bullet = plZip22.instance()
		rofTimer.start(bullet.rateOfFire)
		fireGuns(bullet)

func fireGuns(bullet):
	bullet.position = get_global_position()
	get_parent().add_child(bullet)
