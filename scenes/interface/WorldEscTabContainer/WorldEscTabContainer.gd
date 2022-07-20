extends TabContainer


signal opened
signal closed



func _ready():
	hide()



func _input(_event):
	if Input.is_action_just_pressed("esc"):
		visible = !visible
		if visible:
			emit_signal("opened")
			return
		emit_signal("closed")



func _on_ResumeGenericButton_pressed():
	emit_signal("closed")
	hide()


func _on_OptionsGenericButton_pressed():
	current_tab = 1


func _on_OptionsBackGenericButton_pressed():
	current_tab = 0
