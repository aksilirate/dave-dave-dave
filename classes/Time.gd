class_name Time





static func get_formatted(time: float) -> String:
	var mils = fmod(time,1)*1000
	var sec = fmod(time, 60)
	var mins = fmod(time, 60*60) / 60
	var hours = fmod(fmod(time, 3600*60) / 3600, 24)
	return "%02d:%02d:%02d.%03d" % [hours, mins, sec, mils]
