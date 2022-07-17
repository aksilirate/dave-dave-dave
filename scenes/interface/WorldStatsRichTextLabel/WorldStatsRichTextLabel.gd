extends RichTextLabel



onready var adventure_world_data = DataLoader.adventure_world_data as WorldData
onready var local_player_body = adventure_world_data.local_player_body_data as PlayerBodyData


func _ready():
	var completed: String = "no"
	
	if adventure_world_data.completed:
		completed = "yes"
		
	text = "latest run:" + "\n" + "\n" + "\n" + \
	"completed: " + completed + "\n" + "\n" +\
	"time: " + Time.get_formatted(local_player_body.play_time) + "\n" + "\n" +\
	"deaths: " + str(local_player_body.deaths)
