class_name WolrdNetworkManager
extends NetworkManager


export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var world_data = world_scene.world_data as WorldData

onready var local_player_body_data = world_data.local_player_body_data as PlayerBodyData






func _ready():
	local_player_body_data.connect("input_set", self, "_on_local_player_body_input_set")






func _on_local_player_body_input_set():
	if not network_editor.is_lobby_owner():
		network_editor.add_to_request_packet_index(1)
		
		var input_packet = InputPacket.new()
		input_packet.player_id = Steam.getSteamID()
		input_packet.time_sent = OS.get_ticks_msec()
		input_packet.index = network_editor.request_packet_index
		input_packet.input = local_player_body_data.input
		
		_send_unreliable_packet(network_editor.get_looby_owner_id(), input_packet)









func send_position_packet(player_id, index):
	for member_id in get_lobby_member_ids():
		
		if not world_data.online_player_bodies_data.has(player_id):
			return
			
		var online_player_body_data = world_data.online_player_bodies_data[player_id] as PlayerBodyData
		var position_packet = PositionPacket.new()
#		position_packet.time_sent = OS.get_ticks_msec()
#		position_packet.index = index
#		position_packet.id = player_id
#		position_packet.position = online_player_body_data.last_position
		_send_unreliable_packet(member_id, position_packet) 






func _physics_process(_delta):
	if network_editor.is_lobby_owner():
		send_position_packet(Steam.getSteamID(), 0)
	
		for player_id in world_data.online_player_bodies_data.keys():
			var player_body_data = world_data.online_player_bodies_data[player_id] as PlayerBodyData
			
			if player_body_data.is_processed_on_server:
				send_position_packet(player_id, player_body_data.request_index)




func _on_ServerTickTimer_timeout():
	pass # Replace with function body.
