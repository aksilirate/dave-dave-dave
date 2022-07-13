class_name OptionCheckBox
extends CheckBox


onready var option_check_box_editor: OptionCheckBoxEditor = DataLoader.option_check_box_data as OptionCheckBoxEditor

onready var options_data: OptionsData = DataLoader.options_data




func _ready():
	_update_toggle()


func _update_toggle():
	pass
