class_name SfxAudioStreamPlayerFactory
extends Node



export(PackedScene) var sfx_audio_stream_player




func _play_sfx(audio_path: String, volume_db: float = 0.0, pitch_scale: float = 0.0):
	var sfx_audio_stream_player_instance: SfxAudioStreamPlayer = sfx_audio_stream_player.instance()
	sfx_audio_stream_player_instance.volume_db = volume_db
	sfx_audio_stream_player_instance.pitch_scale = pitch_scale
	add_child(sfx_audio_stream_player_instance)
	sfx_audio_stream_player_instance.playing = true




