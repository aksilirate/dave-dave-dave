class_name WolrdNetworkManager
extends NetworkManager


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var world_data: WorldData = current_game_state.world_data
onready var local_player_body_data: PlayerBodyData = world_data.local_player_body_data






func _send_velocity_sync_packet(player_body_data: PlayerBodyData):
	for member_id in get_lobby_member_ids():
		var player_body_velocity_sync_packet = PlayerBodyVelocitySyncPacket.new()
		player_body_velocity_sync_packet.player_id = player_body_data.body.player_id
		player_body_velocity_sync_packet.velocity = player_body_data.velocity
		_send_reliable_packet(member_id, player_body_velocity_sync_packet) 





func _send_position_sync_packet(player_body_data: PlayerBodyData):
	for member_id in get_lobby_member_ids():
		var player_body_position_sync_packet = PlayerBodyPositionSyncPacket.new()
		player_body_position_sync_packet.player_id = player_body_data.body.player_id
		player_body_position_sync_packet.position = player_body_data.last_position
		_send_unreliable_packet(member_id, player_body_position_sync_packet) 



func _physics_process(_delta):
	_send_velocity_sync_packet(world_data.local_player_body_data)
	_send_position_sync_packet(world_data.local_player_body_data)


