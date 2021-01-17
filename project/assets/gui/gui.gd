extends CanvasLayer

func _ready():
	get_tree().paused = true
	get_node("Mainmenu").show()
