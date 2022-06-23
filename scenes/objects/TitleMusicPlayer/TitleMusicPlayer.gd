extends AudioStreamPlayer




func _ready():
	Options.connect("music_volume_updated", self, "_on_music_volume_updated")
	volume_db = Options.get_music_volume_db() - 10
	if Save.exists() and Save.get_player_deaths() >= 500:
		stream = preload("res://assets/sounds/ambient_reversed.wav")


func _on_music_volume_updated(arg_volume_db):
	volume_db = arg_volume_db - 10


func _on_PreTitle_tree_exited():
	playing = true
