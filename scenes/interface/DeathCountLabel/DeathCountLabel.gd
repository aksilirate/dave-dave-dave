extends Label



onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data


var _signal


func _ready():
	_signal = local_player_body_data.connect("deaths_changed", self, "_on_local_player_body_deaths_changed")


func _on_local_player_body_deaths_changed():
	text = "deaths: " + str(local_player_body_data.deaths)
