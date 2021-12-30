extends Sprite



var target_location: Vector2

var unlocked = false

func _ready():
	Options.connect("hide_pet_updated", self, "_on_options_hide_pet_updated")
	set_as_toplevel(true)
	unlocked = Save.get_pet_unlocked()
	visible = !Options.get_hide_pet()
	
	if not unlocked:
		hide()
	
	modulate = Save.get_pet_color()
	texture = load(Save.get_pet_texture_path())
	

func _on_options_hide_pet_updated():
	hide()
	if unlocked:
		visible = !Options.get_hide_pet()


func _physics_process(delta):
	global_position = global_position.linear_interpolate(target_location, delta)
	
	if (global_position - target_location).normalized().x < 0:
		flip_h = false
	if (global_position - target_location).normalized().x > 0:
		flip_h = true
