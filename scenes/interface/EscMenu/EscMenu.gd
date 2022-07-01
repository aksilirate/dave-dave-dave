extends Control






func _ready():
	hide()



func _input(event):
	if Input.is_action_pressed("esc"):
		visible = !visible


func _on_ResumeGenericButton_pressed():
	hide()
