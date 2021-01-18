extends Node2D

onready var lootNode

func _ready():
	pass 

func _physics_process(delta):
	pass

func levelCompleted():
	get_tree().change_scene("res://assets/gui/levelComplete.tscn")
