extends Node2D

var location=1
var location_name=["ONLINE", "ROCK AND STONE"]

func _process(delta):
	$Label.text=location_name[location]

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
