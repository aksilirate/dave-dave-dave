extends AudioPlayer


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "destruction":
		_play_sfx("res://assets/sounds/weak_block_break.wav")
