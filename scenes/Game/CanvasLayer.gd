extends CanvasLayer


onready var pause_menu = $PauseMenu
onready var joystick = $Joystick
onready var d_pad = $DPad

func _ready():
	Options.connect("d_pad_updated", self, "_on_d_pad_updated")
	pause_menu.hide()

func _on_d_pad_updated():
	joystick.update_visibility()
	d_pad.update_visibility()

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("esc"):
			pause_menu.visible = !pause_menu.visible

func _on_ResumeButton_pressed():
	pause_menu.hide()


func _on_OptionsButton_pressed():
	var options_screen = preload("res://scenes/OptionsScreen/OptionsScreen.tscn").instance()
	options_screen.connect("tree_exiting", self, "_on_options_screen_tree_exiting")
	add_child(options_screen)


func _on_options_screen_tree_exiting():
	if OS.get_name() != "Android":
		pause_menu.resume_button.grab_focus()


func _on_MenuButton_pressed():
	pause_menu.show()
