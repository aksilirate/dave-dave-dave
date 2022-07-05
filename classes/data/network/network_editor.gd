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




func set_packet(value):
	packet = value
	emit_signal("packet_recieved")
