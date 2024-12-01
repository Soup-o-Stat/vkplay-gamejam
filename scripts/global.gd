extends Node

var ver="0.0.24"

var max_fps=DisplayServer.screen_get_refresh_rate()
var main_menu_start_melt=false

var list_of_fps=[30, 60, 90, 120, 144, 240]
var list_of_quality=["НИЗКОЕ", "СРЕДНЕЕ", "ВЫСОКОЕ"]

var current_fps=0
var max_fps_in_list=0

var current_qual="СРЕДНЕЕ"
var max_qual=2

var maxdb=0
var mindb=-60
var current_volume_music=100
var current_volume_sound=100

var slide_step=0
var global_swipe_start=0

var current_level=1
var current_location=1
var first_max_levels=8
var second_max_levels=8
var score=0
var dead_enemies=0
var level_clear=0

var high_score_reached=0

var high_score_1_1=0
var high_score_1_2=0
var high_score_1_3=0
var high_score_1_4=0
var high_score_1_5=0
var high_score_1_6=0
var high_score_1_7=0
var high_score_1_8=0

var high_score_2_1=0
var high_score_2_2=0
var high_score_2_3=0
var high_score_2_4=0
var high_score_2_5=0
var high_score_2_6=0
var high_score_2_7=0
var high_score_2_8=0

var medal=0

var num_of_balls=0
var choosen_ball=1

var reload_main_scene=0


func _ready():
	Input.set_use_accumulated_input(false)
	current_fps=snapped(max_fps, 1)
	for i in range(len(list_of_fps)):
		if list_of_fps[i]==snapped(max_fps, 1):
			print(i)
			#current_fps=list_of_fps[i]
			print("Current fps = "+ str(current_fps))
			max_fps_in_list=i
			print("Max fps in list = "+str(max_fps_in_list))
			print("Max fps  = "+str(list_of_fps[max_fps_in_list]))
			Engine.max_fps=current_fps
		
