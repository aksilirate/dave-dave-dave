extends Control




onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("pre_title")


func _input(event):
	if event is InputEventKey:
		animation_player.play("loaded")
