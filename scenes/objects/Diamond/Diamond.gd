class_name Diamond
extends Area2D


export(Resource) var diamond_editor = diamond_editor as DiamondEditor



func _ready():
	$AnimationPlayer.play("idle")


func _on_Diamond_body_entered(body):
	diamond_editor.set_last_collected_diamond_position(global_position)
	queue_free()
