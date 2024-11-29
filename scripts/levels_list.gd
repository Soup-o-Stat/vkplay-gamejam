extends Node2D

var location=1
var location_name=["ONLINE", "ROCK AND STONE", "CASTLEVANYA"]

func _process(delta):
	$Label.text=location_name[location]

func _ready():
	if Global.current_location==1:
		$bg/location_2.hide()
		$bg/location_1.show()
	if Global.current_location==2:
		$bg/location_1.hide()
		$bg/location_2.show()

func go_to_level(level):
	MusicHandler.play_music("rock_and_stone")
	get_tree().change_scene_to_packed(level)

func _on_level_1_pressed():
	var level=load("res://scenes/level_"+str(location)+"_1.tscn")
	go_to_level(level)

func _on_level_2_pressed():
	var level=load("res://scenes/level_"+str(location)+"_2.tscn")
	go_to_level(level)

func _on_level_3_pressed():
	var level=load("res://scenes/level_"+str(location)+"_3.tscn")
	go_to_level(level)

func _on_level_4_pressed():
	var level=load("res://scenes/level_"+str(location)+"_4.tscn")
	go_to_level(level)

func _on_level_5_pressed():
	var level=load("res://scenes/level_"+str(location)+"_5.tscn")
	go_to_level(level)
