extends Area2D




func _on_HiddenArea_body_entered(body):
	hide()


func _on_HiddenArea_body_exited(body):
	show()
