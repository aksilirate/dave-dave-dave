class_name NetworkEditor
extends NetworkData




func set_lobby_id(value):
	if lobby_id != value:
		lobby_id = value
		emit_signal("lobby_id_changed")



func set_connected_players(value):
	if connected_players != value:
		connected_players = value
		emit_signal("connected_players_changed")



func add_to_connected_players(value):
	connected_players.push_back(value)
	emit_signal("connected_players_changed")



func remove_from_connected_players(value):
	connected_players.erase(value)
	emit_signal("connected_players_changed")





func set_sent_packet(value):
	sent_packet = value
	emit_signal("packet_sent")




func set_received_packet(value):
	received_packet = value
	emit_signal("packet_received")



func set_ping(value):
	if ping != value:
		ping = value
		emit_signal("ping_changed")
