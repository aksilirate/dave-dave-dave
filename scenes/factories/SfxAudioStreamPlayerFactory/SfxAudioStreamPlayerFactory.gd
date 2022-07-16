class_name SfxAudioStreamPlayerFactory
extends Node



export(PackedScene) var sfx_audio_stream_player




func _play_sfx(audio_path: String, volume_db: float = 0.0, pitch_scale: float = 1.0):
	var sfx_audio_stream_player_instance: SfxAudioStreamPlayer = sfx_audio_stream_player.instance()
	sfx_audio_stream_player_instance.stream = load(audio_path)
	sfx_audio_stream_player_instance.volume_db = volume_db
	sfx_audio_stream_player_instance.pitch_scale = pitch_scale
	add_child(sfx_audio_stream_player_instance)






func _on_LocalPlayerBody_jumped():
	_play_sfx("res://assets/sounds/jump.wav")


func _on_LocalPlayerBody_second_jumped():
	_play_sfx("res://assets/sounds/second_jump.wav")


func _on_LocalPlayerBody_stepped():
	_play_sfx("res://assets/sounds/step.wav", -15)


func _on_GenericButton_pressed():
	_play_sfx("res://assets/sounds/button_press.wav")
