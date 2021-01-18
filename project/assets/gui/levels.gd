extends Control

func _ready():
	$VBoxContainer/lblLoot.text = str(global.totalLoot)

func _on_btnlvl1_pressed():
	get_tree().change_scene("res://assets/stages/stages.tscn")

func _on_btnQuit_pressed():
	get_tree().quit(0)
