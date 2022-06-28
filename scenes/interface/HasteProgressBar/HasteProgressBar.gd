extends ProgressBar



export(NodePath) onready var player_body = get_node(player_body) as PlayerBody


func _ready():
	player_body.connect("ready", self, "_on_player_body_ready")


func _on_player_body_ready():
	player_body.player_body_data.connect("haste_changed", self, "_on_player_body_haste_changed")


func _on_player_body_haste_changed():
	value = player_body.player_body_data.haste * 10.0
