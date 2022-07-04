class_name WolrdNetworkManager
extends NetworkManager


export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var local_player_body_data = world_scene.world_data.local_player_body_data as PlayerBodyData


func _ready():
	local_player_body_data.connect("input_changed", self, "_on_local_player_body_input_changed")




func _on_local_player_body_input_changed():
	pass
