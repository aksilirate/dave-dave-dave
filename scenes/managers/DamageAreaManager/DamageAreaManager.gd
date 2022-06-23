extends Node



export(NodePath) onready var spikes = get_node(spikes) as Node2D



var damage_area_editor: DamageAreaEditor = GameData.damage_area_data as DamageAreaEditor



func _ready():
	for element in spikes.get_children():
		var damage_area: DamageArea = element
		damage_area.connect("body_entered", self, "_on_damage_area_body_entered")



func _on_damage_area_body_entered(body):
	damage_area_editor.set_last_collided_body(body)


func _on_Spikes24_body_entered(body):
	print("??")
	damage_area_editor.set_last_collided_body(body)
