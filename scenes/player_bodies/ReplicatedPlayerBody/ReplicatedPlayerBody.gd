class_name ReplicatedPlayerBody
extends PlayerBody





func _ready():
	_signal = network_data.connect("packet_received", self, "_on_packet_received")





func _on_packet_received():
	var packet = network_data.received_packet
	
	if packet is PlayerBodyPositionSyncPacket:
		if packet.player_id == player_id:
			
			if global_position == packet.position:
				return
				
			position_history.push_back(packet.position)





func get_player_id() -> int:
	for player_id in current_game_state.world_data.online_player_bodies_data.keys():
		var online_player_body_data: PlayerBodyData = current_game_state.world_data.online_player_bodies_data[player_id]
		if online_player_body_data == player_body_editor:
			return player_id
			
	return 0


