extends Node


signal all_data_initialized

onready var data_path: String = "user://data"

onready var game_states: GameStates = $GameStates

var game_state_data: GameStateData


var options_data: OptionsData
var generic_button_data: GenericButtonData
var option_check_box_data: OptionCheckBoxData
var option_h_slider_data: OptionHSliderData

var cutscene_animation_player_data: CutsceneAnimationPlayerData

var damage_area_data: DamageAreaData
var checkpoint_data: CheckpointData
var diamond_data: DiamondData
var item_area_data: ItemAreaData
var item_remover_area_data: ItemRemoverAreaData
var second_jump_data: SecondJumpData
var mover_block_data: MoverBlockData
var green_gate_data: GreenGateData
var cyan_gate_data: CyanGateData
var haste_potion_data: HastePotionData
var achievement_area_data: AchievementAreaData
var finish_area_data: FinishAreaData



var online_world_data = online_world_data as WorldData

var adventure_world_data = adventure_world_data as WorldData



var directory = Directory.new()


var finished: bool



func _ready():
	_init_folders()
	_init_all_data()
	finished = true
	emit_signal("all_data_initialized")




func _init_folders():
	directory.open("user://")
	directory.make_dir("data")
	directory.make_dir("data/online_world")
	directory.make_dir("data/adventure_world")




func _init_all_data():
	game_state_data = DataResource.init_data(data_path + "/GameState.tres", GameStateEditor.new()) as GameStateData
	options_data = DataResource.init_data(data_path + "/Options.tres", OptionsEditor.new()) as OptionsData
	generic_button_data = DataResource.init_data(data_path + "/GenericButton.tres", GenericButtonEditor.new()) as GenericButtonData
	option_check_box_data = DataResource.init_data(data_path + "/OptionCheckBox.tres", OptionCheckBoxEditor.new()) as OptionCheckBoxData
	option_h_slider_data = DataResource.init_data(data_path + "/OptionHSliderData.tres", OptionHSliderEditor.new()) as OptionHSliderData
	
	
	cutscene_animation_player_data = DataResource.init_data(data_path + "/CutsceneAnimationPlayer.tres", CutsceneAnimationPlayerEditor.new()) as CutsceneAnimationPlayerData
	
	
	damage_area_data = DataResource.init_data(data_path + "/DamageArea.tres", DamageAreaEditor.new()) as DamageAreaData
	checkpoint_data = DataResource.init_data(data_path + "/Checkpoint.tres", CheckpointEditor.new()) as CheckpointData
	diamond_data = DataResource.init_data(data_path + "/Diamond.tres", DiamondEditor.new()) as DiamondData
	item_area_data = DataResource.init_data(data_path + "/ItemArea.tres", ItemAreaEditor.new()) as ItemAreaData
	item_remover_area_data = DataResource.init_data(data_path + "/ItemRemoverArea.tres", ItemRemoverAreaEditor.new()) as ItemRemoverAreaData
	second_jump_data = DataResource.init_data(data_path + "/SecondJump.tres", SecondJumpEditor.new()) as SecondJumpData
	mover_block_data = DataResource.init_data(data_path + "/MoverBlock.tres", MoverBlockEditor.new()) as MoverBlockData
	green_gate_data = DataResource.init_data(data_path + "/GreenGate.tres", GreenGateEditor.new()) as GreenGateData
	cyan_gate_data = DataResource.init_data(data_path + "/CyanGate.tres", CyanGateEditor.new()) as CyanGateEditor
	haste_potion_data = DataResource.init_data(data_path + "/HastePotion.tres", HastePotionEditor.new()) as HastePotionData
	achievement_area_data = DataResource.init_data(data_path + "/AchievementArea.tres", AchievementAreaEditor.new()) as AchievementAreaData
	finish_area_data = DataResource.init_data(data_path + "/FinishArea.tres", FinishAreaEditor.new()) as FinishAreaData
	
	
	var online_world_local_player_data = DataResource.init_data(data_path + "/online_world/LocalPlayerBody.tres", PlayerBodyEditor.new()) as PlayerBodyData
	var new_online_world_editor = WorldEditor.new()
	new_online_world_editor.local_player_body_data = online_world_local_player_data
	online_world_data = DataResource.init_data(data_path + "/online_world/World.tres", new_online_world_editor) as WorldData
	
	
	
	
	var adventure_world_local_player_data = DataResource.init_data(data_path + "/adventure_world/LocalPlayerBody.tres", PlayerBodyEditor.new()) as PlayerBodyData
	var new_adventure_world_editor = WorldEditor.new()
	new_adventure_world_editor.local_player_body_data = adventure_world_local_player_data
	adventure_world_data = DataResource.init_data(data_path + "/adventure_world/World.tres", new_adventure_world_editor) as WorldData







