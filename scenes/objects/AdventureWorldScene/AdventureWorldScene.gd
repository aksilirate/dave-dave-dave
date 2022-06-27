class_name AdventureWorld
extends WorldScene



func _ready():
	if new_game:
		_world_editor.set_activated_checkpoints([])
