extends Sprite


onready var animation_player = $AnimationPlayer
export (bool) var idle_playing = false



func _ready():
	if idle_playing:
		animation_player.play("idle")

