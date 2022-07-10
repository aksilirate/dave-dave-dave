extends Node2D


export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var network_data: NetworkData = DataLoader.network_data

export(PackedScene) var replicated_player_body_scene

onready var spawn_position = $SpawnPosition


var spawned_player_bodies: Array


func _ready():
	world_scene.world_data.connect("online_player_bodies_data_loaded", self, "_on_online_player_bodies_data_loaded")
	spawn_missing_player_bodies()


func _on_online_player_bodies_data_loaded():
	spawn_missing_player_bodies()


func spawn_missing_player_bodies():
	for element in network_data.connected_players:
		var player_id: int = element
		
		if not world_scene.world_data.online_player_bodies_data.keys().has(player_id):
			return
		
		if not spawned_player_bodies.has(player_id):
			spawned_player_bodies.push_back(player_id)
			
			var replicated_player_body_instance: ReplicatedPlayerBody = replicated_player_body_scene.instance()
			replicated_player_body_instance.world_scene = world_scene.get_path()
			replicated_player_body_instance.player_id = player_id
			add_child(replicated_player_body_instance)
			replicated_player_body_instance.global_position = spawn_position.global_position
