class_name CutsceneAnimationPlayerEditor
extends CutsceneAnimationPlayerData







func set_playing(value):
	if playing != value:
		playing = value
		emit_signal("playing_changed")
