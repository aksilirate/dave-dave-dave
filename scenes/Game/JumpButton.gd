extends TextureButton


#
#func _ready():
#	if OS.get_name() != "Android":
#		hide()


func _input(event):
	if event is InputEventScreenTouch:
		make_input_local(event)
		var input_action: = InputEventAction.new()
		input_action.pressed = pressed
		input_action.action = "jump"
		Input.parse_input_event(input_action)
	
