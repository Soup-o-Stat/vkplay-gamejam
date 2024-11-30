extends Node2D

var location=1
var location_name=["ONLINE", "ROCK AND STONE", "CASTLEVANYA"]

func change_bg():
	$Label.text=location_name[location]
	if location==1:
		$bg/location_2.hide()
		$bg/location_1.show()
	if location==2:
		$bg/location_1.hide()
		$bg/location_2.show()

func _ready():
	$arrow_right.frame=0
	$arrow_right.play()
	$arrow_left.frame=0
	$arrow_left.play()
	change_bg()

func go_to_level(level):
	if location==1:
		MusicHandler.play_music("rock_and_stone")
	if location==2:
		MusicHandler.play_music("castlevanya")
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

func _on_level_6_pressed():
	var level=load("res://scenes/level_"+str(location)+"_6.tscn")
	go_to_level(level)

func _on_level_7_pressed():
	var level=load("res://scenes/level_"+str(location)+"_7.tscn")
	go_to_level(level)

func _on_level_8_pressed():
	var level=load("res://scenes/level_"+str(location)+"_8.tscn")
	go_to_level(level)

func _on_arrow_right_button_pressed():
	location+=1
	if location>2:
		location=1
	change_bg()

func _on_arrow_left_button_pressed():
	location-=1
	if location<1:
		location=2
	change_bg()
