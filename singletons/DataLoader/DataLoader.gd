extends Node


onready var data_path: String = Steamworks.get_user_path() + "/data"



var options_data: OptionsData
var generic_button_data: GenericButtonData
var damage_area_data: DamageAreaData
var diamond_data: DiamondData
var second_jump_data: SecondJumpData

var adventure_player_body_data = adventure_player_body_data as PlayerBodyData
var adventure_checkpoint_data = adventure_checkpoint_data as CheckpointData
var adventure_world_data = adventure_world_data as WorldData


var directory = Directory.new()


var finished: bool



func _ready():
	_init_folders()
	_init_data()
	finished = true



func _init_folders():
	directory.open(Steamworks.get_user_path())
	directory.make_dir("data")
	directory.make_dir("data/adventure_world")



func _init_data():
	_init_options_data()
	_init_generic_button_data()
	_init_damage_area_data()
	_init_diamond_data()
	_init_second_jump_data()
	
	
	_init_adventure_player_body_data()
	_init_adventure_checkpoint_data()
	_init_adventure_world_data()





func _init_options_data():
	var options_path: String = data_path + "/Options.tres"
	if not directory.file_exists(options_path):
		var new_options_editor = OptionsEditor.new()
		ResourceSaver.save(options_path, new_options_editor)
		
	options_data = ResourceLoader.load(options_path) as OptionsData





func _init_generic_button_data():
	var generic_button_path: String = data_path + "/GenericButton.tres"
	if not directory.file_exists(generic_button_path):
		var new_generic_button_editor = GenericButtonEditor.new()
		ResourceSaver.save(generic_button_path, new_generic_button_editor)
		
	generic_button_data = ResourceLoader.load(generic_button_path) as GenericButtonData




func _init_damage_area_data():
	var damage_area_path: String = data_path + "/DamageArea.tres"
	if not directory.file_exists(damage_area_path):
		var new_damage_area_editor = DamageAreaEditor.new()
		ResourceSaver.save(damage_area_path, new_damage_area_editor)
		
	damage_area_data = ResourceLoader.load(damage_area_path) as DamageAreaData





func _init_diamond_data():
	var diamond_path: String = data_path + "/Diamond.tres"
	if not directory.file_exists(diamond_path):
		var new_diamond_editor = DiamondEditor.new()
		ResourceSaver.save(diamond_path, new_diamond_editor)
		
	diamond_data = ResourceLoader.load(diamond_path) as DiamondData



func _init_second_jump_data():
	var second_jump_path: String = data_path + "/SecondJump.tres"
	if not directory.file_exists(second_jump_path):
		var new_second_jump_editor = SecondJumpEditor.new()
		ResourceSaver.save(second_jump_path, new_second_jump_editor)
		
	second_jump_data = ResourceLoader.load(second_jump_path) as SecondJumpData





func _init_adventure_player_body_data():
	var adventure_player_body_data_path: String = data_path + "/adventure_world/PlayerBody.tres"
	if not directory.file_exists(adventure_player_body_data_path):
		var new_player_body_editor = PlayerBodyEditor.new()
		ResourceSaver.save(adventure_player_body_data_path, new_player_body_editor)
		
	adventure_player_body_data = ResourceLoader.load(adventure_player_body_data_path) as PlayerBodyData





func _init_adventure_checkpoint_data():
	var adventure_checkpoint_data_path: String = data_path + "/adventure_world/Checkpoint.tres"
	if not directory.file_exists(adventure_checkpoint_data_path):
		var new_checkpoint_editor = CheckpointEditor.new()
		ResourceSaver.save(adventure_checkpoint_data_path, new_checkpoint_editor)
		
	adventure_checkpoint_data = ResourceLoader.load(adventure_checkpoint_data_path) as CheckpointData




func _init_adventure_world_data():
	var adventure_world_data_path: String = data_path + "/adventure_world/World.tres"
	if not directory.file_exists(adventure_world_data_path):
		var new_adventure_world_editor = WorldEditor.new()
		
		new_adventure_world_editor.player_body_data = adventure_player_body_data
		new_adventure_world_editor.checkpoint_data = adventure_checkpoint_data
		
		ResourceSaver.save(adventure_world_data_path, new_adventure_world_editor)
		
	adventure_world_data = ResourceLoader.load(adventure_world_data_path) as WorldData

