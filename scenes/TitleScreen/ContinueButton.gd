extends Button




func _ready():
	disabled = !Save.exists()



func _on_ContinueButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	get_tree().change_scene("res://scenes/Game/Game.tscn")
