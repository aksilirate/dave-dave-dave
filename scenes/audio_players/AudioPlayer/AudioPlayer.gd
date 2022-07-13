class_name AudioPlayer
extends AudioStreamPlayer


onready var options_data: OptionsData = DataLoader.options_data
export(PackedScene) var audio_stream_player



func _play_sfx(audio_path: String, arg_volume_db: float =  0.0, pitch: float = 1.0):
	var audio_stream_player_instance = audio_stream_player.instance()
	audio_stream_player_instance.stream = load(audio_path)
	audio_stream_player_instance.volume_db = arg_volume_db
	audio_stream_player_instance.pitch_scale = pitch
	audio_stream_player_instance.autoplay = true
	add_child(audio_stream_player_instance)
