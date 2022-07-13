extends Area2D




func _on_HiddenArea_body_entered(_body):
	hide()


func _on_HiddenArea_body_exited(_body):
	show()
