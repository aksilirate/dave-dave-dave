extends Button





func _ready():
	if Globals.zero_deaths_mode:
		text = "exit"
