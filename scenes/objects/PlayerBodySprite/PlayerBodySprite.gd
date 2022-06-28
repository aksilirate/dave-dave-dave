class_name PlayerBodySprite
extends Sprite


export(NodePath) onready var player_body = get_node(player_body) as PlayerBody




func _ready():
	player_body.connect("ready", self, "_on_player_body_ready")



func _on_player_body_ready():
	player_body.player_body_data.connect("haste_changed", self, "_on_player_body_haste_changed")
	player_body.player_body_data.connect("deaths_changed", self, "_on_player_body_deaths_changed")




func _on_player_body_haste_changed():
	_update_sprite()


func _on_player_body_deaths_changed():
	_update_sprite()



func _update_sprite():
	var deaths = player_body.player_body_data.deaths
	var haste = player_body.player_body_data.haste
	
	modulate = Color("#00f8f8") if deaths < 1000 else Color("#f80000")
	if haste > 0:
		modulate = Color("#f800f8")



func _physics_process(_delta):
	if player_body.is_moving():
		offset.x = 2 * int(player_body.displacement.x < 0) if player_body.gravity > 0 else int(player_body.displacement.x > 0)
		flip_h = player_body.displacement.x < 0 if player_body.gravity > 0 else player_body.displacement.x > 0




