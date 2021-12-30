extends CheckBox






func _ready():
	if Options.exists():
		pressed = Options.get_hide_pet()
