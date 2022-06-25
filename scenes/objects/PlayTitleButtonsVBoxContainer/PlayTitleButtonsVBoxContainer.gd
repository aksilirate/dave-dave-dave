extends VBoxContainer




func _ready():
	hide()



func _on_PlayGenericButton_pressed():
	show()



func _on_AdvantureGenericButton_pressed():
	hide()


func _on_PlayBackGenericButton_pressed():
	hide()


func _on_AdvantureBackGenericButton_pressed():
	show()
