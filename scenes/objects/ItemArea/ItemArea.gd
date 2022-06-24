class_name ItemArea
extends Area2D

onready var sprite = $Sprite

export(String) var item_name


func _ready():
	$AnimationPlayer.play("idle")


