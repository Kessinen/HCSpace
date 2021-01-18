extends Control


#onready var plStages = preload("res://assets/stages/stages.tscn")

func _ready():
	pass



func _on_btnQuit_pressed():
	get_tree().quit(0)


func _on_btnNew_pressed():
	get_tree().change_scene("res://assets/gui/levels.tscn")
