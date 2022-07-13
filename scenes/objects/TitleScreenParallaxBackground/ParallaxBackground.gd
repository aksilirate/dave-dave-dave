extends ParallaxBackground


var viewport_size
var mouse_pos: Vector2
var relative_x
var relative_y


var _signal


func _ready():
	_signal = get_tree().get_root().connect("size_changed", self, "viewport_changed") # register event if viewport changes
	viewport_changed()
	relative_x = 0
	relative_y = 0







func _process(_delta):
	relative_x = -1 * (mouse_pos.x - (viewport_size.x/2)) / (viewport_size.x/2)
	relative_y = -1 * (mouse_pos.y - (viewport_size.y/2)) / (viewport_size.y/2)
	
	var count = 30
	for child in self.get_children(): # for each parallaxlayer do...
		child.motion_offset.x = count * relative_x
		child.motion_offset.y = count * relative_y
		count = count * 1.9



func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos = event.position




func viewport_changed():
	viewport_size = get_viewport().size
	for child in self.get_children():
		var sprite: Sprite = child.get_node("Sprite")
		var sprite_size := sprite.texture.get_size()
		var ratio := max(viewport_size.x / sprite_size.x, viewport_size.y / sprite_size.y)
		sprite.scale = Vector2(ratio + 0.25, ratio + 0.25)

		sprite.position = viewport_size / 2

