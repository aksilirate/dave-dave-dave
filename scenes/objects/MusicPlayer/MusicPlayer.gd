extends AudioStreamPlayer

export(AudioStream) var title_screen_music


func _ready():
	Game.connect("current_state_changed", self, "_on_current_game_state_changed")
	
	volume_db = Game.options_data.music_volume_db - 10
	
	if Save.exists() and Save.get_player_deaths() >= 500:
		stream = preload("res://assets/sounds/ambient_reversed.wav")



func _on_current_game_state_changed():
	if Game.current_state == Game.State.TITLE:
		stream = title_screen_music
		playing = true
		return
	stop()



func _on_music_volume_updated(arg_volume_db):
	volume_db = arg_volume_db - 10


func _on_PreTitle_tree_exited():
	playing = true
