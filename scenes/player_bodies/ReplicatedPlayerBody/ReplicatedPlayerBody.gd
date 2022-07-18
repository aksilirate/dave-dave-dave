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
	
	if packet is PlayerBodyPositionSyncPacket:
		if packet.player_id == player_id:
			
			if global_position == packet.position:
				return
				
			position_history.push_back(packet.position)
	
	
	if packet is PlayerBodyInventorySyncPacket:
		if packet.player_id == player_id:
			print(packet.inventory)
			
			var inventory: Array
			for element in packet.inventory:
				inventory.push_back(dict2inst(element))
			
			print(inventory)
			
			player_body_editor.set_inventory(inventory)
			return
	
	
	if packet is PlayerBodyHasteTimeSyncPacket:
		if packet.player_id == player_id:
			player_body_editor.set_haste_time(packet.haste_time)
			return
	
	if packet is PlayerBodyDeathSyncPacket:
		if packet.player_id == player_id:
			_die()
			return





func get_player_id() -> int:
	for player_id in current_game_state.world_data.online_player_bodies_data.keys():
		var online_player_body_data: PlayerBodyData = current_game_state.world_data.online_player_bodies_data[player_id]
		if online_player_body_data == player_body_editor:
			return player_id
			
	return 0


