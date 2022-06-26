class_name ControllablePlayerBody
extends PlayerBody



signal second_jumped






func _process(delta):
	player_body_editor.add_to_play_time(delta)



func _physics_process(delta):
	player_body_editor.remove_from_haste(delta)
	player_body_editor.set_haste(max(0.0, player_body_editor.haste))
