extends AudioStreamPlayer




func _on_AnmbientPlayer_finished():
	play()
	pitch_scale += 0.01
