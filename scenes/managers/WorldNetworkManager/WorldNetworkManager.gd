class_name WolrdNetworkManager
extends NetworkManager


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var world_data: WorldData = current_game_state.world_data
onready var local_player_body_data: PlayerBodyData = world_data.local_player_body_data




func _ready():
	_signal = local_player_body_data.connect("inventory_changed", self, "_on_player_body_inventory_changed")
	_signal = local_player_body_data.connect("haste_time_changed", self, "_on_player_body_haste_time_changed")




func _on_player_body_inventory_changed():
	if network_editor.lobby_id:
		_send_inventory_sync_packet(world_data.local_player_body_data)




func _on_player_body_haste_time_changed():
	if network_editor.lobby_id:
		_send_haste_time_sync_packet(world_data.local_player_body_data)



func _physics_process(_delta):
	if network_editor.lobby_id:
		_send_position_sync_packet(world_data.local_player_body_data)




func _send_position_sync_packet(player_body_data: PlayerBodyData):
	for member_id in get_lobby_member_ids():
		var player_body_position_sync_packet = PlayerBodyPositionSyncPacket.new()
		player_body_position_sync_packet.player_id = player_body_data.body.player_id
		player_body_position_sync_packet.position = player_body_data.last_position
		_send_unreliable_packet(member_id, player_body_position_sync_packet) 




func _send_inventory_sync_packet(player_body_data: PlayerBodyData):
	for member_id in get_lobby_member_ids():
		var player_body_inventory_sync_packet = PlayerBodyInventorySyncPacket.new()
		player_body_inventory_sync_packet.player_id = player_body_data.body.player_id
		player_body_inventory_sync_packet.inventory = player_body_data.inventory
		_send_reliable_packet(member_id, player_body_inventory_sync_packet) 




func _send_haste_time_sync_packet(player_body_data: PlayerBodyData):
	for member_id in get_lobby_member_ids():
		var player_body_haste_time_sync_packet = PlayerBodyHasteTimeSyncPacket.new()
		player_body_haste_time_sync_packet.player_id = player_body_data.body.player_id
		player_body_haste_time_sync_packet.haste_time = player_body_data.haste_time
		_send_reliable_packet(member_id, player_body_haste_time_sync_packet) 







