extends ColorRect

func _on_shieldsBar_value_changed(value):
	$VBoxContainer/HBoxContainer/VBoxContainer/lblShield.text = str(value)

func _on_hpBar_value_changed(value):
	$VBoxContainer/HBoxContainer/VBoxContainer2/lblHP.text = str(value)

func _on_energyBar_value_changed(value):
	$VBoxContainer/HBoxContainer/VBoxContainer3/lblEnergy.text = str(value)
