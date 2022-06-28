extends Node


onready var data_path: String = Steamworks.get_user_path() + "/data"



var options_data: OptionsData
var generic_button_data: GenericButtonData
var damage_area_data: DamageAreaData
var checkpoint_data: CheckpointData
var diamond_data: DiamondData
var item_area_data: ItemAreaData
var second_jump_data: SecondJumpData


var adventure_player_body_data = adventure_player_body_data as PlayerBodyData
var adventure_world_data = adventure_world_data as WorldData


var directory = Directory.new()


var finished: bool



func _ready():
	_init_folders()
	_init_all_data()
	finished = true



func _init_folders():
	directory.open(Steamworks.get_user_path())
	directory.make_dir("data")
	directory.make_dir("data/adventure_world")



func _init_all_data():
	options_data = _init_data(data_path + "/Options.tres", OptionsEditor.new()) as OptionsData
	generic_button_data = _init_data(data_path + "/GenericButton.tres", GenericButtonEditor.new()) as GenericButtonData
	damage_area_data = _init_data(data_path + "/DamageArea.tres", DamageAreaEditor.new()) as DamageAreaData
	checkpoint_data = _init_data(data_path + "/Checkpoint.tres", CheckpointEditor.new()) as CheckpointData
	diamond_data = _init_data(data_path + "/Diamond.tres", DiamondEditor.new()) as DiamondData
	item_area_data = _init_data(data_path + "/ItemArea.tres", ItemAreaEditor.new()) as ItemAreaData
	second_jump_data = _init_data(data_path + "/SecondJump.tres", SecondJumpEditor.new()) as SecondJumpData
	
	
	
	adventure_player_body_data = _init_data(data_path + "/adventure_world/PlayerBody.tres", PlayerBodyEditor.new()) as PlayerBodyData
	
	
	var new_adventure_world_editor = WorldEditor.new()
	new_adventure_world_editor.player_body_data = adventure_player_body_data
	
	adventure_world_data = _init_data(data_path + "/adventure_world/World.tres", new_adventure_world_editor) as WorldData






func _init_data(arg_path: String, editor: Resource) -> Resource:
	if not directory.file_exists(arg_path):
		ResourceSaver.save(arg_path, editor)
	return ResourceLoader.load(arg_path)



