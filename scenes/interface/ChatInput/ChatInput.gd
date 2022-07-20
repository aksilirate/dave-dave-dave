extends LineEdit


onready var chat_input_editor = DataLoader.chat_input_data as ChatInputEditor


func _ready():
	hide()




#func _input(_event):
#	if Input.is_action_pressed("chat"):
#		visible = !visible
#
#		chat_input_editor.set_shown(visible)
#
#		if visible:
#			grab_focus()
#			return
#
#		chat_input_editor.set_text(text)
#		chat_input_editor.emit_signal("activated")
#
#		text = ""
