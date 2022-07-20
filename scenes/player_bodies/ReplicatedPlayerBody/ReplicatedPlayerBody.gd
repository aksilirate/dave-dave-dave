class_name ReplicatedPlayerBody
extends PlayerBody





func _ready():
	_signal = network_data.connect("connected_players_changed", self, "_on_connected_players_changed")
	_signal = network_data.connect("packet_received", self, "_on_packet_received")





func _on_connected_players_changed():
	if not network_data.connected_players.has(player_id):
		queue_free()






func _on_packet_received():
	var packet = network_data.received_packet
	
	if not packet is PlayerBodySyncPacket:
		return
	
	
	if packet.player_id == player_id:
		if packet is PlayerBodyPositionSyncPacket:
			if global_position == packet.position:
				return
				
			packet_history.push_back([packet])
			return
		
		
		if packet_history.size():
			packet_history[packet_history.size() - 1].push_back(packet)
			return
		
		packet_history.push_back([packet])
		return





func get_player_id() -> int:
	for player_id in current_game_state.world_data.online_player_bodies_data.keys():
		var online_player_body_data: PlayerBodyData = current_game_state.world_data.online_player_bodies_data[player_id]
		if online_player_body_data == player_body_editor:
			return player_id
			
	return 0


