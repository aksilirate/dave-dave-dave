extends Label




func _ready():
	if OS.get_name() != "Android":
		hide()
