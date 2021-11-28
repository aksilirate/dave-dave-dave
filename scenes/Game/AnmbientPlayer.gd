extends AudioStreamPlayer



func _ready():
	Options.connect("music_volume_updated", self, "_on_music_volume_updated")
	volume_db = Options.get_music_volume_db() - 10


func _on_music_volume_updated(arg_volume_db):
	volume_db = arg_volume_db - 10

func _on_AnmbientPlayer_finished():
	play()
	pitch_scale += 0.01
