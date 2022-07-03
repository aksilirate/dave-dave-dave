class_name NetworkEditor
extends NetworkData




func set_lobby_id(value):
	if lobby_id != value:
		lobby_id = value
		emit_signal("lobby_id_changed")
	


func set_packet(value):
	packet = value
	emit_signal("packet_set")
