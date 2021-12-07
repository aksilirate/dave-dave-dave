extends Control


func _ready():
	update_visibility()


func update_visibility():
	if OS.get_name() != "Android":
		hide()
		return
		
	hide()
		
	if Options.get_d_pad():
		show()
