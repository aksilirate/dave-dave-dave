extends ColorRect


onready var resume_button = $VBoxContainer/ResumeButton



#func _on_PauseMenu_visibility_changed():
#	if visible and OS.get_name() != "Android" and Options.get_enable_selection():
#		resume_button.grab_focus()
