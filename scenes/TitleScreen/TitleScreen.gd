extends Control





func _on_OptionsButton_pressed():
	var options_screen = preload("res://scenes/OptionsScreen/OptionsScreen.tscn").instance()
	add_child(options_screen)




