class_name GreenGate
extends Area2D


onready var green_gate_editor = DataLoader.green_gate_data as GreenGateEditor


func _on_GreenGate_body_entered(body):
	green_gate_editor.set_entered_body(body)
