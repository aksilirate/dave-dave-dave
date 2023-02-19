class_name WorldScene
extends Node2D


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var world_editor = current_game_state.world_data as WorldEditor
onready var finish_area_data = DataLoader.finish_area_data as FinishAreaData


var _signal

func _ready():
	_signal = finish_area_data.connect("activated", self, "_on_finish_area_activated")
	
	world_editor.set_played(true)
	if current_game_state.reset_data:
		world_editor.set_completed(false)
	

func _on_finish_area_activated():
	world_editor.set_completed(true)
