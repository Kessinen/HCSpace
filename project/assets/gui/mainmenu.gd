extends Control


#onready var plStages = preload("res://assets/stages/stages.tscn")

func _ready():
	pass



func _on_btnQuit_pressed():
	get_tree().quit(0)


func _on_btnNew_pressed():
	var stages = get_parent().get_node("stages")
	stages.show()
	get_tree().paused = false
	
	
	pass
