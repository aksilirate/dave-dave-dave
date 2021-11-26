extends CanvasLayer


onready var pause_menu = $PauseMenu


func _ready():
	pause_menu.hide()

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("esc"):
			pause_menu.visible = !pause_menu.visible


func _on_ResumeButton_pressed():
	pause_menu.hide()
