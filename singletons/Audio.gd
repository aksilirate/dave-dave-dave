extends Node





func play(audio_path: String, volume: float =  0.0, pitch: float = 1.0):
	var audio_stream_player = preload("res://scenes/AudioStreamPlayer/AudioStreamPlayer.tscn").instance()
	audio_stream_player.stream = load(audio_path)
	audio_stream_player.volume_db = volume
	audio_stream_player.pitch_scale = pitch
	add_child(audio_stream_player)
	audio_stream_player.playing = true

