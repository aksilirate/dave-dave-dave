extends GenericButton





func _on_AdventureContinueGenericButton_visibility_changed():
	disabled = !Game.adventure_world_data.played
