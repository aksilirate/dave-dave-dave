class_name FinishArea
extends Area2D



onready var finish_area_editor = DataLoader.finish_area_data as FinishAreaEditor



func _on_FinishArea2D_body_entered(body):
	finish_area_editor.set_entered_body(body)
