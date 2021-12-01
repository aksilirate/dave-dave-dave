extends CanvasLayer


onready var pause_menu = $PauseMenu


func _ready():
	pause_menu.hide()

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("esc"):
			pause_menu.visible = !pause_menu.visible

func _on_ResumeButton_pressed():
	pause_menu.hide()


func _on_OptionsButton_pressed():
	var options_screen = preload("res://scenes/OptionsScreen/OptionsScreen.tscn").instance()
	add_child(options_screen)


func _on_MenuButton_pressed():
	print(1)
	pause_menu.show()
