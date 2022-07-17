class_name WallGun
extends Node2D


signal shot


export(PackedScene) var bullet




func shoot():
	var bullet_instance = bullet.instance()
	bullet_instance.speed = 10
	bullet_instance.direction = Vector2(1,0).rotated(rotation)
	call_deferred("add_child", bullet_instance)


func _on_ShootTimer_timeout():
	shoot()
	emit_signal("shot")
