class_name PlayerBodySprite
extends Sprite


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState

onready var replicated_player_body_factory_data: ReplicatedPlayerBodyFactoryData = DataLoader.replicated_player_body_factory_data

onready var player_body_data: PlayerBodyData


var _signal


func _ready():
	player_body_data = current_game_state.world_data.local_player_body_data
	if replicated_player_body_factory_data.lastest_spawned_player_id:
		player_body_data = current_game_state.world_data.online_player_bodies_data[replicated_player_body_factory_data.lastest_spawned_player_id]
		
	_signal = player_body_data.connect("deaths_changed", self, "_on_player_body_deaths_changed")
	_signal = player_body_data.connect("haste_time_changed", self, "_on_player_body_haste_time_changed")
	_update_sprite()





func _on_player_body_deaths_changed():
	_update_sprite()


func _on_player_body_haste_time_changed():
	_update_sprite()





func _update_sprite():
	var deaths = player_body_data.deaths
	var haste_time = player_body_data.haste_time
	
	modulate = Color("#00f8f8") if deaths < 1000 else Color("#f80000")
	if haste_time > 0:
		modulate = Color("#f800f8")



func _physics_process(_delta):
	if player_body_data.displacement:
		offset.x = 2 * int(player_body_data.displacement.x < 0) if player_body_data.gravity > 0 else int(player_body_data.displacement.x > 0)
		flip_h = player_body_data.displacement.x < 0 if player_body_data.gravity > 0 else player_body_data.displacement.x > 0




