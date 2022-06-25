extends ColorRect

signal finished


onready var animation_player = $AnimationPlayer


func _ready():
	show()
	animation_player.play("show")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "show":
		emit_signal("finished")
		animation_player.play("hide")
	if anim_name == "hide":
		queue_free()
