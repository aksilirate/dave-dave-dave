extends Area2D


onready var text_label = $TextLabel


func _ready():
	text_label.hide()

func _on_Sign_body_entered(_body):
	text_label.show()


func _on_Sign_body_exited(_body):
	text_label.hide()
