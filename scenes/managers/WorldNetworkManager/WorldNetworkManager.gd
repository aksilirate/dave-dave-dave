class_name WolrdNetworkManager
extends NetworkManager


export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var local_player_body_data = world_scene.world_data.local_player_body_data as PlayerBodyData


func _ready():
	local_player_body_data.connect("input_set", self, "_on_local_player_body_input_set")




func _on_local_player_body_input_set():
	if not network_editor.is_lobby_owner():
		var looby_owner_id: int = Steam.getLobbyOwner(network_editor.lobby_id)
		var input_packet = InputPacket.new()
		input_packet.id = Steam.getSteamID()
		input_packet.input = local_player_body_data.input
		_send_reliable_packet(looby_owner_id, input_packet.to_dictionary())
