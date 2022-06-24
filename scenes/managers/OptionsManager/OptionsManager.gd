class_name OptionsManager
extends Node



onready var options_editor: OptionsEditor = Game.options_data as OptionsEditor




func _ready():
	options_editor.connect("fullscreen_changed", self, "_on_fullscreen_changed")
	_update_fullscreen()
	options_editor.fullscreen = false

func _on_fullscreen_changed():
	_update_fullscreen()



func _update_fullscreen():
	OS.window_fullscreen = Game.options_data.fullscreen



func _on_FullscreenOptionCheckBox_toggled(button_pressed):
	options_editor.set_fullscreen(button_pressed)


