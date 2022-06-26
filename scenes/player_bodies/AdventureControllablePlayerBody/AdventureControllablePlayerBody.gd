class_name AdventureControllablePlayerBody
extends ControllablePlayerBody


func _ready():
	Game.connect("new_adventure_game_started", self, "_on_new_adventure_game_started")


func _on_new_adventure_game_started():
	player_body_editor.set_play_time(0.0)
