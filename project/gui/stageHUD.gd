extends Node2D

onready var hpBar := $ui/VBoxContainer/HBoxContainer/VBoxContainer2/hpBar
onready var shieldsBar := $ui/VBoxContainer/HBoxContainer/VBoxContainer/shieldsBar
onready var energyBar := $ui/VBoxContainer/HBoxContainer/VBoxContainer3/energyBar

func levelCompleted():
	get_tree().change_scene("res://assets/gui/levelComplete.tscn")

func updateLoot(amount : int):
	var lblCash = $Panel/HBoxContainer/lblCash
	lblCash.text = str(amount)

func initBars(hp : float, shield : float, energy : float):
	hpBar.max_value = hp
	hpBar.value = hp
	shieldsBar.max_value = shield
	shieldsBar.value = shield
	energyBar.max_value = energy
	energyBar.value = energy
	
func updateBars(hp : float, shield : float, energy : float):
	if hpBar.value != hp:
		hpBar.value = hp
	if shieldsBar.value != shield:
		shieldsBar.value = shield
	if energyBar.value != energy:
		energyBar.value = energy

func _on_shieldsBar_value_changed(value):
	$ui/VBoxContainer/HBoxContainer/VBoxContainer/lblShield.text = str(value)

func _on_hpBar_value_changed(value):
	$ui/VBoxContainer/HBoxContainer/VBoxContainer2/lblHP.text = str(value)
	
func _on_energyBar_value_changed(value):
	$ui/VBoxContainer/HBoxContainer/VBoxContainer3/lblEnergy.text = str(value)
