class_name Diamond
extends Area2D


onready var diamond_editor = DataLoader.diamond_data as DiamondEditor



func _ready():
	$AnimationPlayer.play("idle")
	diamond_editor.add_to_diamonds(global_position)


func _on_Diamond_body_entered(body):
	diamond_editor.set_last_collected_diamond_position(global_position)
	queue_free()
