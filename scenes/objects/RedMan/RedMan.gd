extends Sprite

signal died

onready var animation_player = $AnimationPlayer
export (bool) var idle_playing = false



func _ready():
	hide()
	if idle_playing:
		animation_player.play("idle")



func _on_Area2D_area_entered(area: Node2D):
	animation_player.play("death")
	emit_signal("died")
	area.queue_free()
