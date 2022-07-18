extends Sprite


onready var options_data: OptionsData = DataLoader.options_data

var target_location: Vector2

var _signal

func _ready():
	_signal = options_data.connect("hide_pet_changed", self, "_on_hide_pet_changed")
	set_as_toplevel(true)
	modulate.a = 0



func _update_hidden():
	if options_data.hide_pet:
		hide()
		return
	show()



#func _ready():
#	unlocked = Save.get_pet_unlocked()
#
#
#	modulate = Save.get_pet_color()
#	var pet_texture = Save.get_pet_texture_path()
#	if pet_texture != "":
#		texture = load(pet_texture)
#	else:
#		texture = null
#
#	if not unlocked:
#		modulate.a = 0
#
#func _on_options_hide_pet_updated():
#	if unlocked:
#		visible = !Options.get_hide_pet()
#
#
#func _physics_process(delta):
#	global_position = global_position.linear_interpolate(target_location, delta)
#
#	if (global_position - target_location).normalized().x < 0:
#		flip_h = false
#	if (global_position - target_location).normalized().x > 0:
#		flip_h = true


