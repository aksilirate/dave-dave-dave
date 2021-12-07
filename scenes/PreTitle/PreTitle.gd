extends ColorRect

onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("pre_title")

func _input(event):
	if event is InputEventKey or event is InputEventScreenTouch:
		return_to_title_screen()
		
func return_to_title_screen():
	get_tree().change_scene("res://scenes/TitleScreen/TitleScreen.tscn")
