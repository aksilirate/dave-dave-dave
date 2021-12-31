extends Button





func _ready():
	if OS.get_name() != "Android":
		grab_focus()
