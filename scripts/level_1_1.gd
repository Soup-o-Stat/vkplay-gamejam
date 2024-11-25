extends Node2D

var level_modulate_speed=1
var swipe_started = false
var swipe_start = Vector2()
var minimum_drag = 100
var slide_step=0

func level_name_modulate(delta):
	if $ColorRect.modulate.a>0:
		$ColorRect.modulate.a-=level_modulate_speed*delta
	else:
		$Control.visible=true
		$ColorRect.visible=false  

func _ready():
	$ColorRect.visible=true
	$ColorRect.modulate.a=2

func _process(delta):
	level_name_modulate(delta)

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
			if slide_step!=0:
				$SysImage.position.x=320
				slide_step-=1
		if swipe[0]<0:
			if slide_step!=1:
				$SysImage.position.x=960
				slide_step+=1
