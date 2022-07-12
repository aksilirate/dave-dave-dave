class_name CutsceneEditor
extends CutsceneData







func set_active_cutscene(value):
	if active_cutscene != value:
		active_cutscene = value
		emit_signal("active_cutscene_changed")
