extends Control


func _ready():
	$VBoxContainer/HBoxContainer/lblLoot.text = str(global.loot)
	global.bankBalance += global.loot
	

func _on_Button_pressed():
	get_tree().change_scene("res://menus/levels.tscn")
