class_name Checkpoint
extends Area2D

signal activated

onready var sprite = $Sprite



func activate():
	sprite.frame = 1
	emit_signal("activated")
	
	

func deactivate():
	sprite.frame = 2



func _on_Checkpoint_body_entered(body):
	activate()
