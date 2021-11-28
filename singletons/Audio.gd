extends Node


var sfx_volume_percentage: float


func _ready():
	sfx_volume_percentage = Options.get_sfx_volume_percentage()
	Options.connect("sfx_volume_updated", self, "_on_sfx_volume_updated")

func _on_sfx_volume_updated(arg_sfx_volume_percentage):
	sfx_volume_percentage = arg_sfx_volume_percentage

func play(audio_path: String, volume: float =  0.0, pitch: float = 1.0):
	var audio_stream_player = preload("res://scenes/AudioStreamPlayer/AudioStreamPlayer.tscn").instance()
	audio_stream_player.stream = load(audio_path)
	audio_stream_player.volume_db = linear2db(db2linear(volume) * sfx_volume_percentage)
	audio_stream_player.pitch_scale = pitch
	add_child(audio_stream_player)
	audio_stream_player.playing = true

