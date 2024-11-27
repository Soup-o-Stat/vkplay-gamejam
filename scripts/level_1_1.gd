extends Node2D

var level_modulate_speed=1
var swipe_started = false
var swipe_start = Vector2()
var minimum_drag = 50

func level_name_modulate(delta):
	if $CanvasLayer/ColorRect.modulate.a>0:
		$CanvasLayer/ColorRect.modulate.a-=level_modulate_speed*delta
	else:
		$Control.visible=true
		$CanvasLayer/ColorRect.visible=false  

func _ready():
	Global.choosen_ball=1
	Global.num_of_balls=3
	Global.dead_enemies=0
	Global.score=0
	$CanvasLayer/ColorRect.visible=true
	$CanvasLayer/ColorRect.modulate.a=2

func _process(delta):
	level_name_modulate(delta)
	global_swipe()
	if Global.dead_enemies==2:
		if $CanvasLayer/score_label.local_score==Global.score:
			get_tree().change_scene_to_file("res://scenes/level_1_2.tscn")

func _on_control_gui_input(event):
	if event.is_action_pressed("left_mouse"):
		swipe_started = true
		swipe_start = get_global_mouse_position()
	if event.is_action_released("left_mouse") and swipe_started:
		swipe_started = false
		_calculate_swipe(get_global_mouse_position())

func _calculate_swipe(swipe_end):
	var swipe = swipe_end - swipe_start
	if swipe.length() > minimum_drag:
		if swipe[0]>0:
			if Global.slide_step!=0:
				$SysImage.position.x=320
				Global.slide_step-=1
		if swipe[0]<0:
			if Global.slide_step!=1:
				$SysImage.position.x=960
				Global.slide_step+=1

func global_swipe():
	if Global.global_swipe_start==1:
		if Global.slide_step==1:
			$SysImage.position.x=320
		if Global.slide_step==1:
			$SysImage.position.x=960
		Global.global_swipe_start=0
