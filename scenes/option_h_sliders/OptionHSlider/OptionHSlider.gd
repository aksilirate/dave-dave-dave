class_name OptionHSlider
extends HSlider


onready var options_data: OptionsData = DataLoader.options_data


onready var option_h_slider_editor: OptionHSliderEditor = DataLoader.option_h_slider_data


export(bool) var initial_focus_grab



var _signal


func _ready():
	_signal = options_data.connect("interface_selection_changed", self, "_on_interface_selection_changed")




func _on_interface_selection_changed():
	update_focus()



func update_focus():
	if options_data.interface_selection:
		focus_mode = Control.FOCUS_ALL
		if visible:
			if initial_focus_grab:
				grab_focus()
		return
		
	focus_mode = Control.FOCUS_NONE



func _on_OptionHSlider_visibility_changed():
	update_focus()
