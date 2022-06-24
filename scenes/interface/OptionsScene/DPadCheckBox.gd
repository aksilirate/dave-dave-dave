extends CheckBox







func _ready():
	if Options.exists():
		pressed = Options.get_d_pad()
	if OS.get_name() != "Android":
		hide()
