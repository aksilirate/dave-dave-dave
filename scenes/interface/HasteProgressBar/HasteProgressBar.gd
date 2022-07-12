extends ProgressBar


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data


func _ready():
	local_player_body_data.connect("haste_time_changed", self, "_on_player_body_haste_time_changed")


func _on_player_body_haste_time_changed():
	value = local_player_body_data.haste_time * 10.0
