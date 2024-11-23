extends Node2D

var label_step = 0
var angle = 0
var speed = 3
var amplitude = 0.05
var modulate_speed=3

func _ready():
	#Engine.max_fps=60
	$"intro_label".modulate.a = -1
	$FcIntro.modulate.a=-1

func label_angle(delta):
	angle += speed * delta
	$intro_label.rotation = amplitude * sin(angle)

func play_with_label_modulate(delta):
	if label_step == 0:
		if $intro_label.modulate.a < 1:
			$intro_label.modulate.a += modulate_speed*delta
		else:
			label_step = 1
			$intro_label/Timer.start()
	if label_step==1:
		if $intro_label/Timer.is_stopped():
			label_step=2
	if label_step==2:
		if $intro_label.modulate.a > 0:
			$intro_label.modulate.a -= modulate_speed*delta
		else:
			label_step = 3
	if label_step==3:
		if $FcIntro.modulate.a < 1:
			$FcIntro.modulate.a += modulate_speed*delta
		else:
			label_step = 4
			$FcIntro/Timer.start()
	if label_step==4:
		if $FcIntro/Timer.is_stopped():
			label_step=5
	if label_step==5:
		if $FcIntro.modulate.a > 0:
			$FcIntro.modulate.a -= modulate_speed*delta
		else:
			label_step = 6
	if label_step==6:
		if $intro_music.playing==false:
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
			
func _process(delta):
	play_with_label_modulate(delta)
	label_angle(delta)
