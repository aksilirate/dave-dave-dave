class_name CyanGate
extends Area2D


onready var cyan_gate_editor = DataLoader.cyan_gate_data as CyanGateEditor





func _on_CyanGate_body_entered(body):
	cyan_gate_editor.set_entered_body(body)
