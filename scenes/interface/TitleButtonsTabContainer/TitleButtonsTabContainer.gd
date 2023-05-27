extends TabContainer


func _ready():
	$MainTitleVBoxContainer/ExitGenericButton.visible = false



func _on_PlayGenericButton_pressed():
	current_tab = 1


func _on_AdvantureBackGenericButton_pressed():
	current_tab = 1
