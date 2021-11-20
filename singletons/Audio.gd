extends Node





func play(audio_path: String):
	var audio_stream_player = preload("res://scenes/AudioStreamPlayer/AudioStreamPlayer.tscn").instance()
	audio_stream_player.stream = load(audio_path)
	add_child(audio_stream_player)
	audio_stream_player.playing = true

