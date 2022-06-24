extends Control

onready var animation_player = $AnimationPlayer





func _on_OptionsButton_pressed():
	animation_player.seek(animation_player.current_animation_length, true)




func _on_PreTitle_tree_exited():
	animation_player.play("load")




func _on_ExtrasButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	animation_player.seek(animation_player.current_animation_length, true)
	var extras_screen = preload("res://scenes/ExtrasScreen/ExtrasScreen.tscn").instance()
	add_child(extras_screen)



