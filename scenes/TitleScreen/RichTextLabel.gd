extends RichTextLabel







func _ready():
	var completed: String = "no"
	if Stats.get_completed():
		completed = "yes"
	if Stats.exists():
		text = "latest save:" + "\n" + "\n" + "\n" + \
		"completed: " + completed + "\n" + "\n" +\
		"time: " + Time.get_formatted(Stats.get_time()) + "\n" + "\n" +\
		"deaths: " + str(Stats.get_deaths())


