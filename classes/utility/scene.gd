class_name Scene






static func set_active(scene: Node, active: bool):
	scene.propagate_call("set_process", [active])
	scene.propagate_call("set_physics_process", [active])
	scene.propagate_call("set_process_internal", [active])
	scene.propagate_call("set_physics_process_internal", [active])
	scene.propagate_call("set_process_input", [active])
	scene.visible = active
