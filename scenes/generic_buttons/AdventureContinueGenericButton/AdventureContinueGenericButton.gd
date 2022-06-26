extends GenericButton



export(Resource) var adventure_world_data = adventure_world_data as WorldData



func _on_AdventureContinueGenericButton_visibility_changed():
	disabled = !adventure_world_data.played
