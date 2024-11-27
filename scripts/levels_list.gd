extends Node2D

var location=1
var location_name=["ONLINE", "ROCK AND STONE"]

func _process(delta):
	$Label.text=location_name[location]

func _on_level_1_pressed():
	var level=load("res://scenes/level_"+str(location)+"_1.tscn")
	get_tree().change_scene_to_packed(level)

func _on_level_2_pressed():
	var level=load("res://scenes/level_"+str(location)+"_2.tscn")
	get_tree().change_scene_to_packed(level)
