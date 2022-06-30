extends Label


onready var diamonds_data = DataLoader.diamond_data as DiamondData




func _ready():
	diamonds_data.connect("total_diamonds_changed", self, "_on_total_diamonds_changed")
	_update_text()



func _on_total_diamonds_changed():
	_update_text()



func _update_text():
	text = "0/" + str(diamonds_data.total_diamonds)
