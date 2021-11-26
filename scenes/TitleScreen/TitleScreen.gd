extends Control


onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("pre_title")


func _input(event):
	if event is InputEventKey:
		animation_player.play("loaded")


func _on_OptionsButton_pressed():
	var options_screen = preload("res://scenes/OptionsScreen/OptionsScreen.tscn").instance()
	add_child(options_screen)




