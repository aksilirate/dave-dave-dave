extends Label


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data



onready var diamonds_data = DataLoader.diamond_data as DiamondData


var _signal


func _ready():
	_signal = local_player_body_data.connect("collected_diamonds_changed", self, "_on_player_body_collected_diamonds_changed")
	_signal = diamonds_data.connect("diamonds_changed", self, "_on_diamonds_changed")

	_update_text()


func _on_player_body_collected_diamonds_changed():
	_update_text()


func _on_diamonds_changed():
	_update_text()



func _update_text():
	text = str(local_player_body_data.collected_diamonds.size()) + "/" + str(diamonds_data.diamonds.size())
