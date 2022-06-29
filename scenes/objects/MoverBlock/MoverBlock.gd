class_name MoverBlock
extends Area2D


onready var mover_block_editor = DataLoader.mover_block_data as MoverBlockEditor

onready var sprite = $AnimatedSprite

export(int) var strength


func _ready():
	sprite.frame = 0


func get_velocity() -> Vector2:
	return Vector2.RIGHT.rotated(rotation) * strength


func _physics_process(_delta):
	for element in get_overlapping_bodies():
		var body: Node2D = element
		mover_block_editor.set_body_to_move(body)
		mover_block_editor.set_velocity(get_velocity())
		mover_block_editor.emit_signal("activated")
