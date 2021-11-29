extends RichTextLabel







func _ready():
	if Stats.exists():
		text = "latest save:" + "\n" + "\n" + "\n" +"time: " + Time.get_formatted(Stats.get_time()) + "\n" + "\n" + "deaths: " + str(Stats.get_deaths())


