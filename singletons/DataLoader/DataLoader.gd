extends Node


var options_data: OptionsData

export(Resource) var adventure_world_data = adventure_world_data as WorldData
export(Resource) var adventure_player_body_data = adventure_player_body_data as PlayerBodyData
export(Resource) var adventure_checkpoint_data = adventure_checkpoint_data as CheckpointData


var directory = Directory.new()

var finished: bool



func _ready():
	_init_folder()
	_init_data()
	finished = true



func _init_folder():
	var user_path: String = Steamworks.get_user_path()
	directory.open(Steamworks.get_user_path())
	directory.make_dir("data")



func _init_data():
	_init_options_data()
	



func _init_options_data():
	var data_path: String = Steamworks.get_user_path() + "/data"
	var options_path: String = data_path + "/Options.tres"
	if not directory.file_exists(options_path):
		var new_options_data = OptionsEditor.new()
		ResourceSaver.save(options_path, new_options_data)
		
	options_data = ResourceLoader.load(options_path) as OptionsData
	print(options_data.fullscreen)





