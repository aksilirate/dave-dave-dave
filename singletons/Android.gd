extends Node




func _ready():
	if OS.get_name() == "Android":
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT,  SceneTree.STRETCH_ASPECT_EXPAND, Vector2(1024,600),1)
