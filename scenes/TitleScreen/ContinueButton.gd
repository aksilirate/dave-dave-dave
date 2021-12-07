extends Button




func _ready():
	disabled = !Save.exists()



func _on_ContinueButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	Globals.ghost_mode = false
	Globals.zero_deaths_mode = false
	get_tree().change_scene("res://scenes/Game/Game.tscn")
