class_name MusicPlayer
extends AudioStreamPlayer


export(Resource) var options_data = options_data as OptionsData



func _ready():
	
	volume_db = options_data.music_volume_db - 10
	
#	if Save.exists() and Save.get_player_deaths() >= 500:
#		stream = preload("res://assets/sounds/ambient_reversed.wav")




func _on_music_volume_updated(arg_volume_db):
	volume_db = arg_volume_db - 10
