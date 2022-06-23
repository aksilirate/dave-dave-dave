extends DamageArea


onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("idle")
