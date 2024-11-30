extends Node2D

var level_modulate_speed=1
var swipe_started = false
var swipe_start = Vector2()
var minimum_drag = 50
var help_book=false

func level_name_modulate(delta):
	if $CanvasLayer/ColorRect.modulate.a>0:
		$CanvasLayer/ColorRect.modulate.a-=level_modulate_speed*delta
	else:
		$Control.visible=true
		$CanvasLayer/ColorRect.visible=false  

func _ready():
	Global.high_score_reached=0
	Global.current_level=1
	Global.current_location=1
	Global.level_clear=0
	Global.slide_step=0
	Global.choosen_ball=1
	Global.num_of_balls=3
	Global.dead_enemies=0
	Global.score=0
	$CanvasLayer/ColorRect.visible=true
	$CanvasLayer/ColorRect.modulate.a=2

func _process(delta):
	if help_book==true:
		if $InfoBook.position.y>144:
			$InfoBook.position.y-=300*delta
		if $InfoBook.position.y<144:
			$InfoBook.position.y=144
	if help_book==false:
		if $InfoBook.position.y<424:
			$InfoBook.position.y+=600*delta
		if $InfoBook.position.y>424:
			$InfoBook.position.y=424
	level_name_modulate(delta)
	global_swipe()
	if Global.dead_enemies==2:
		if Global.level_clear==0:
			Global.score+=Global.num_of_balls*1000
		Global.level_clear=1

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

func _on_help_button_pressed():
	help_book=true

func _on_book_button_pressed():
	help_book=false
