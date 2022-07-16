class_name AudioManager
extends Node


onready var generic_button_data = DataLoader.generic_button_data as GenericButtonEditor

export(PackedScene) var audio_stream_player


var sfx_volume_percentage: float = 1.0



func _ready():
	generic_button_data.connect("last_button_pressed_set", self, "_on_last_button_pressed_set")



func _on_last_button_pressed_set():
	_play("res://assets/sounds/button_press.wav")



func _play(audio_path: String, volume: float =  0.0, pitch: float = 1.0):
	var audio_stream_player_instance = audio_stream_player.instance()
	audio_stream_player_instance.stream = load(audio_path)
	audio_stream_player_instance.volume_db = linear2db(db2linear(volume) * sfx_volume_percentage)
	audio_stream_player_instance.pitch_scale = pitch
	add_child(audio_stream_player_instance)
	audio_stream_player_instance.playing = true




func _on_OptionsScene_hide():
	_play("res://assets/sounds/button_press.wav")


func _on_LocalPlayerBody_jumped():
	_play("res://assets/sounds/jump.wav")

func _on_LocalPlayerBody_second_jumped():
	_play("res://assets/sounds/second_jump.wav")


func _on_LocalPlayerBody_stepped():
	_play("res://assets/sounds/step.wav", -10)
