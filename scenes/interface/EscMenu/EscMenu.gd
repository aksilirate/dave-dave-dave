extends Control






func _ready():
	hide()



func _input(_event):
	if Input.is_action_just_pressed("esc"):
		visible = !visible


func _on_ResumeGenericButton_pressed():
	hide()
