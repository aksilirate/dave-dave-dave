class_name AdventureWorld
extends WorldScene






func _ready():
	hide()


func _on_current_game_state_changed():
	var active: bool = Game.current_state == Game.State.ADVENTURE_WORLD
	if active:
		world_editor.set_played(true)
