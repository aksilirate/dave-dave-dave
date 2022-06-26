extends Label


export(NodePath) onready var player_body = get_node(player_body) as PlayerBody



func _ready():
	player_body.player_body_data.connect("play_time_changed", self, "_on_player_body_play_time_changed")



func _on_player_body_play_time_changed():
	text = Time.get_formatted(player_body.player_body_data.play_time)


