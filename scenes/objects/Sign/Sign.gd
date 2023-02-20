extends Area2D


onready var text_label = $TextLabel

var tween: SceneTreeTween

func _ready():
	text_label.hide()




func _on_Sign_body_entered(_body):
	text_label.percent_visible = 0
	tween = create_tween()
	tween.tween_property(text_label, "percent_visible", 1.0, text_label.text.length() * 0.05)
	text_label.show()


func _on_Sign_body_exited(_body):
	if is_instance_valid(tween):
		tween.kill()
	
	text_label.hide()
