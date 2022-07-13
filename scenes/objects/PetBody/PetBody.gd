extends Sprite


var target_location: Vector2


func _ready():
	set_as_toplevel(true)
	modulate.a = 0
	hide()




#func _ready():
#	Options.connect("hide_pet_updated", self, "_on_options_hide_pet_updated")
#	
#	unlocked = Save.get_pet_unlocked()
#	visible = !Options.get_hide_pet()
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



func _on_PetBody_visibility_changed():
	hide()
