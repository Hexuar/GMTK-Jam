extends TextureRect

@onready var Main = get_node("/root/Main")
@onready var TimeText = $Time
@onready var DeathsText = $Deaths


func _process(_delta: float) -> void:
	var time = Time.get_time_dict_from_unix_time(int(Time.get_ticks_msec() / 1000.0))
	TimeText.text = "[color=\"black\"]Time: %s:%s[/color]" % [time.minute,time.second]
	DeathsText.text = "[color=\"black\"]Deaths: %s[/color]" % Main.deaths 
