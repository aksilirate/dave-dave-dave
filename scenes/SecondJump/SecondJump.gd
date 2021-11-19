class_name SecondJump
extends Area2D

onready var cooldown_timer = $CooldownTimer
onready var animation_player = $AnimationPlayer

var disabled: bool = false

func _ready():
	animation_player.play("idle")


func disable():
	hide()
	disabled = true
	cooldown_timer.start()
	
func enable():
	show()
	disabled = false

func _on_CooldownTimer_timeout():
	enable()
