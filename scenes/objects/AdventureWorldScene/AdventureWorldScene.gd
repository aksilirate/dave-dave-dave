class_name AdventureWorld
extends WorldScene






func _ready():
	Game.connect("current_state_changed", self, "_on_current_game_state_changed")
	hide()


func _on_current_game_state_changed():
	var active: bool = Game.current_state == Game.State.ADVENTURE_WORLD
	Scene.set_active(self, active)
