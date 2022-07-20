extends GenericButton


onready var adventure_world_data = DataLoader.adventure_world_data as WorldData



func update_focus():
	if options_data.interface_selection:
		focus_mode = Control.FOCUS_ALL
		if is_visible_in_tree():
			if adventure_world_data.completed and not adventure_world_data.played:
				grab_focus()
		return
		
	focus_mode = Control.FOCUS_NONE
