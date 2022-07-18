class_name WorldEditor
extends WorldData




func set_online_player_bodies_data(value):
	if online_player_bodies_data != value:
		online_player_bodies_data = value
		emit_signal("online_player_bodies_data_changed")
		emit_changed()



func add_to_online_player_bodies_data(id, value):
	online_player_bodies_data[id] = value
	emit_signal("online_player_bodies_data_changed")
	emit_changed()





func set_played(value):
	played = value
	emit_changed()




func set_completed(value):
	completed = value
	emit_signal("completed_changed")
	emit_changed()
