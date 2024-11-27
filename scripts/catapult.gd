extends CharacterBody2D

var speed = 50
var go_right = false
var go_left = false
var spoon_anim=0

@onready var ball_scene = preload("res://scenes/ball.tscn")
@onready var ball_fire_scene = preload("res://scenes/ball_fire.tscn")
@onready var ball_sharped_scene = preload("res://scenes/ball_sharped.tscn")

var ball=null

func spoon_animation():
	if spoon_anim==1:
		if $StoneSpoon.rotation_degrees<40:
			$StoneSpoon.rotation_degrees+=4
		else:
			spoon_anim=2
	if spoon_anim==2:
		if $StoneSpoon.rotation_degrees>-40:
			$StoneSpoon.rotation_degrees-=1
		else:
			spoon_anim=0

func _process(delta):
	if Global.num_of_balls>0 and spoon_anim==0 and Global.current_qual!="НИЗКОЕ":
		if Global.choosen_ball==1:
			$StoneSpoon/FireBall.visible=false
			$StoneSpoon/SharpedBall.visible=false
			$StoneSpoon/GPUParticles2D.visible=false
			$StoneSpoon/TestBall.visible=true
		if Global.choosen_ball==2:
			$StoneSpoon/FireBall.visible=true
			$StoneSpoon/SharpedBall.visible=false
			$StoneSpoon/GPUParticles2D.visible=true
			$StoneSpoon/TestBall.visible=false
		if Global.choosen_ball==3:
			$StoneSpoon/FireBall.visible=false
			$StoneSpoon/SharpedBall.visible=true
			$StoneSpoon/GPUParticles2D.visible=false
			$StoneSpoon/TestBall.visible=false
	spoon_animation()
	if go_right:
		position.x += speed * delta
	elif go_left:
		position.x -= speed * delta
	
	move_and_slide()

func _on_arrow_right_button_button_down():
	go_right = true

func _on_arrow_right_button_button_up():
	go_right = false

func _on_arrow_left_button_button_down():
	go_left = true

func _on_arrow_left_button_button_up():
	go_left = false

#func _input(event):
	#if event.is_action_pressed("ui_accept"):
		#spawn_ball()

func _ready():
	if Global.current_qual=="ВЫСОКОЕ":
		$StoneSpoon/GPUParticles2D.fixed_fps=60
	if Global.current_qual=="СРЕДНЕЕ":
		$StoneSpoon/GPUParticles2D.fixed_fps=30
	if Global.current_qual=="НИЗКОЕ":
		$StoneSpoon/GPUParticles2D.queue_free()

func spawn_ball():
	if spoon_anim==0 and Global.num_of_balls>0:
		spoon_anim=1
		Global.num_of_balls-=1
		$AudioStreamPlayer.play()
		Global.global_swipe_start=1
		Global.slide_step=1
		if Global.choosen_ball==1:
			ball = ball_scene.instantiate()
			print(1)
		if Global.choosen_ball==2:	
			ball = ball_fire_scene.instantiate()
			print(2)
		if Global.choosen_ball==3:	
			ball = ball_sharped_scene.instantiate()
			print(3)
		ball.position = position - Vector2(0, 40)
		ball.name = "ball"
		print(ball.position, ball.name)
		get_parent().add_child(ball)
		
		if ball is RigidBody2D:
			var arc_velocity = Vector2(1200, -350)
			ball.linear_velocity = arc_velocity
		else:
			print("Error with spawn ball((((")
