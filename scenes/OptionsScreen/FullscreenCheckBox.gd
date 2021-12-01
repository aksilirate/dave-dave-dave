extends CheckBox







func _ready():
	if Options.exists():
		pressed = Options.get_fullscreen()
	if OS.get_name() == "Android":
		hide()
