extends Control

onready var animation_player = $AnimationPlayer





func _ready():
	Game.connect("current_state_changed", self, "_on_current_game_state_changed")



func _on_current_game_state_changed():
	var active: bool = Game.current_state == Game.State.TITLE
	Scene.set_active(self, active)




func _on_OptionsButton_pressed():
	animation_player.seek(animation_player.current_animation_length, true)




func _on_PreTitle_tree_exited():
	animation_player.play("load")




func _on_ExtrasButton_pressed():
	animation_player.seek(animation_player.current_animation_length, true)



