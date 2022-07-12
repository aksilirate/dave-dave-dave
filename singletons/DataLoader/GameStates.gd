class_name GameStates
extends Node



export(String, FILE) var title_state_path
export(String, FILE) var new_adventure_play_state_path
export(String, FILE) var adventure_play_state_path

var title_state: GameState
var new_adventure_play_state: WorldGameState
var adventure_play_state: WorldGameState





func _ready():
	DataLoader.connect("all_data_initialized", self, "_on_all_data_initialized")





func _on_all_data_initialized():
	_init_all_states()





func _init_all_states():
	title_state = _init_game_state(title_state_path)
	new_adventure_play_state = _init_world_game_state(new_adventure_play_state_path, DataLoader.adventure_world_data, true)
	adventure_play_state = _init_world_game_state(adventure_play_state_path, DataLoader.adventure_world_data)



func _init_game_state(path: String) -> GameState:
	var game_state = GameState.new()
	game_state.path = path
	return game_state



func _init_world_game_state(path: String, world_data: WorldData, reset_data: bool = false):
	var world_game_state = WorldGameState.new()
	world_game_state.path = path
	world_game_state.world_data = world_data
	world_game_state.reset_data = reset_data
	return world_game_state
