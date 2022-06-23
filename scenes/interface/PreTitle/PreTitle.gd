extends ColorRect

onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("pre_title")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
