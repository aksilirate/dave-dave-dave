class_name ReplicatedPlayerBodyFactoryEditor
extends ReplicatedPlayerBodyFactoryData




func set_lastest_spawned_player_id(value):
	if lastest_spawned_player_id != value:
		lastest_spawned_player_id = value
		emit_signal("lastest_spawned_player_id_changed")
