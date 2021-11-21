extends Node2D

export (int) var open_duration

onready var animation_player = $AnimationPlayer
onready var second_timer = $SecondTimer
onready var time_label = $Button/TimeLabel

var time_left: int


func _ready():
	animation_player.play("closed")

func _on_Area2D_body_entered(body):
	Audio.play("res://assets/sounds/button_press.wav")
	time_left = open_duration
	update()
	second_timer.start()
	animation_player.play("opened")


func _on_SecondTimer_timeout():
	update()

func update():
	time_left -= 1
	if time_left <= 0:
		animation_player.play("closed")
		second_timer.stop()
	time_label.text = str(time_left)
