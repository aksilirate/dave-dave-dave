class_name SfxAudioStreamPlayer2DFactory
extends Node2D



export(PackedScene) var sfx_audio_stream_player_2d




func _play_sfx_2d(audio_path: String, volume_db: float = 0.0, pitch_scale: float = 1.0):
	var sfx_audio_stream_player_2d_instance: SfxAudioStreamPlayer2D = sfx_audio_stream_player_2d.instance()
	sfx_audio_stream_player_2d_instance.stream = load(audio_path)
	sfx_audio_stream_player_2d_instance.volume_db = volume_db
	sfx_audio_stream_player_2d_instance.pitch_scale = pitch_scale
	add_child(sfx_audio_stream_player_2d_instance)
	sfx_audio_stream_player_2d_instance.global_position = global_position


func _on_WallGun_shot():
	_play_sfx_2d("res://assets/sounds/bullet.wav")
