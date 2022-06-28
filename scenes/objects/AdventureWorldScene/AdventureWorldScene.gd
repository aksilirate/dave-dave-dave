class_name AdventureWorld
extends WorldScene



func _init():
	_world_editor = DataLoader.adventure_world_data as WorldEditor
	world_data = DataLoader.adventure_world_data as WorldData
	
	
	if new_game:
		_world_editor.set_activated_checkpoints([])
