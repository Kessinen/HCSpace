extends Control


func _ready():
	$VBoxContainer/HBoxContainer/lblLoot.text = str(global.loot)
	global.totalLoot += global.loot
	

func _on_Button_pressed():
	get_tree().change_scene("res://assets/gui/levels.tscn")
