extends Node


onready var data_path: String = Steamworks.get_user_path() + "/data"


var network_data: NetworkData

var options_data: OptionsData
var generic_button_data: GenericButtonData
var damage_area_data: DamageAreaData
var checkpoint_data: CheckpointData
var diamond_data: DiamondData
var item_area_data: ItemAreaData
var item_remover_area_data: ItemRemoverAreaData
var locked_door_data: LockedDoorData
var second_jump_data: SecondJumpData
var mover_block_data: MoverBlockData
var green_gate_data: GreenGateData
var haste_potion_data: HastePotionData



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
	network_data = _init_data(data_path + "/Network.tres", NetworkEditor.new()) as NetworkData
	options_data = _init_data(data_path + "/Options.tres", OptionsEditor.new()) as OptionsData
	generic_button_data = _init_data(data_path + "/GenericButton.tres", GenericButtonEditor.new()) as GenericButtonData
	damage_area_data = _init_data(data_path + "/DamageArea.tres", DamageAreaEditor.new()) as DamageAreaData
	checkpoint_data = _init_data(data_path + "/Checkpoint.tres", CheckpointEditor.new()) as CheckpointData
	diamond_data = _init_data(data_path + "/Diamond.tres", DiamondEditor.new()) as DiamondData
	item_area_data = _init_data(data_path + "/ItemArea.tres", ItemAreaEditor.new()) as ItemAreaData
	item_remover_area_data = _init_data(data_path + "/ItemRemoverArea.tres", ItemRemoverAreaEditor.new()) as ItemRemoverAreaData
	locked_door_data = _init_data(data_path + "/LockedDoorData.tres", LockedDoorEditor.new()) as LockedDoorData
	second_jump_data = _init_data(data_path + "/SecondJump.tres", SecondJumpEditor.new()) as SecondJumpData
	mover_block_data = _init_data(data_path + "/MoverBlock.tres", MoverBlockEditor.new()) as MoverBlockData
	green_gate_data = _init_data(data_path + "/GreenGate.tres", GreenGateEditor.new()) as GreenGateData
	haste_potion_data = _init_data(data_path + "/HastePotion.tres", HastePotionEditor.new()) as HastePotionData
	
	
	var adventure_world_local_player_data = _init_data(data_path + "/adventure_world/LocalPlayerBody.tres", PlayerBodyEditor.new()) as PlayerBodyData
	
	
	var new_adventure_world_editor = WorldEditor.new()
	new_adventure_world_editor.local_player_body_data = adventure_world_local_player_data
	
	adventure_world_data = _init_data(data_path + "/adventure_world/World.tres", new_adventure_world_editor) as WorldData






func _init_data(arg_path: String, editor: Resource) -> Resource:
	if not directory.file_exists(arg_path):
		ResourceSaver.save(arg_path, editor)
	return ResourceLoader.load(arg_path)

