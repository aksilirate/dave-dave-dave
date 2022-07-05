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
		
		var looby_owner_id: int = Steam.getLobbyOwner(network_editor.lobby_id)
		var input_packet = InputPacket.new()
		input_packet.id = Steam.getSteamID()
		input_packet.input = local_player_body_data.input
		input_packet.index = network_editor.request_packet_index
		_send_reliable_packet(looby_owner_id, input_packet.to_dictionary())




func _on_StateUpdateTimer_timeout():
	if network_editor.is_lobby_owner():
		for player_id in world_data.online_player_bodies_data.keys():
			send_position_packet(player_id)







func send_position_packet(player_id):
	for member_id in get_lobby_member_ids():
		var online_player_body_data = world_data.online_player_bodies_data[player_id] as PlayerBodyData
		var position_packet = PositionPacket.new()
		position_packet.id = player_id
		position_packet.position = online_player_body_data.last_position
		_send_unreliable_packet(member_id, position_packet.to_dictionary()) 





func _physics_process(_delta):
	if network_editor.is_lobby_owner():
		for member_id in get_lobby_member_ids():
			var position_packet = PositionPacket.new()
			position_packet.id = Steam.getSteamID()
			position_packet.position = local_player_body_data.last_position
			_send_unreliable_packet(member_id, position_packet.to_dictionary()) 



