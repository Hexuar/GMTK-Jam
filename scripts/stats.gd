extends TextureRect

@onready var Main = get_node("/root/Main")
@onready var TimeText = $Time
@onready var DeathsText = $Deaths

var timerPaused = false
var timePlayed : float = 0 # Seconds


func _process(delta: float) -> void:
	if !get_tree().paused and ! timerPaused:
		timePlayed += delta
		
	var time = Time.get_time_dict_from_unix_time(int(timePlayed))
	
	TimeText.text = "[color=\"black\"]Time: %s:%s[/color]" % [time.minute,time.second]
	DeathsText.text = "[color=\"black\"]Deaths: %s[/color]" % Main.deaths 
