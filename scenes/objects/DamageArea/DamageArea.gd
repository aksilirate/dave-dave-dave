class_name DamageArea
extends Area2D


export(Resource) var damage_area_editor = damage_area_editor as DamageAreaEditor



func _on_DamageArea_body_entered(body):
	damage_area_editor.set_last_collided_body(body)
