class_name DamageArea
extends Area2D


var damage_area_editor: DamageAreaEditor = Game.damage_area_data as DamageAreaEditor



func _on_DamageArea_body_entered(body):
	damage_area_editor.set_last_collided_body(body)
