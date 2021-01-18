extends Node2D

var loot = 0

func _ready():
	pass # Replace with function body.

func _exit_tree():
	global.loot = loot
