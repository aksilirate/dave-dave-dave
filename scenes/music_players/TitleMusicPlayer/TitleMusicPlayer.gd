class_name TitleMusicPlayer
extends MusicPlayer

export(AudioStream) var title_screen_music






func _on_PreTitleScene_finished():
	playing = true
