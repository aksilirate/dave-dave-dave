class_name WolrdNetworkManager
extends NetworkManager


export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var world_data = world_scene.world_data as WorldData

onready var local_player_body_data = world_data.local_player_body_data as PlayerBodyData






func _ready():
	local_player_body_data.connect("input_set", self, "_on_local_player_body_input_set")






func _on_local_player_body_input_set():
	if not network_editor.is_lobby_owner():
		var player_body_sync_request = PlayerBodySyncRequestPacket.new()
		player_body_sync_request.player_id = Steam.getSteamID()
		player_body_sync_request.input = local_player_body_data.input
		
		_send_unreliable_packet(network_editor.get_looby_owner_id(), player_body_sync_request)









func _send_position_packet(player_body_data: PlayerBodyData):
	for member_id in get_lobby_member_ids():
		var player_body_sync_respond_packet = PlayerBodySyncRespondPacket.new()
		player_body_sync_respond_packet.player_id = player_body_data.body.player_id
		player_body_sync_respond_packet.tick_sent = OS.get_ticks_msec()
		player_body_sync_respond_packet.position = player_body_data.last_position
		player_body_sync_respond_packet.velocity = player_body_data.last_velocity
		_send_unreliable_packet(member_id, player_body_sync_respond_packet) 






func _physics_process(_delta):
	if network_editor.is_lobby_owner():
		_send_position_packet(world_data.local_player_body_data)
	
		for player_id in world_data.online_player_bodies_data.keys():
			var player_body_data = world_data.online_player_bodies_data[player_id] as PlayerBodyData
			if player_body_data.body == null:
				return
			_send_position_packet(player_body_data)



