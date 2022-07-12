class_name WorldScene
extends Node2D


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState

onready var world_editor = current_game_state.world_data as WorldEditor

onready var network_data: NetworkData = DataLoader.network_data




func _ready():
	world_editor.set_played(true)

