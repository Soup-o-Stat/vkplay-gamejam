extends CharacterBody2D

var speed = 50
var go_right = false
var go_left = false

# Загрузка сцены объекта "ball"
@onready var ball_scene = preload("res://scenes/ball.tscn")

func _process(delta):
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

func _input(event):
	if event.is_action_pressed("ui_accept"):
		spawn_ball()

func spawn_ball():
	$AudioStreamPlayer.play()
	Global.global_swipe_start=1
	Global.slide_step=1
	var ball = ball_scene.instantiate()
	ball.position = position - Vector2(0, 20)
	ball.name = "ball"
	print(ball.position, ball.name)
	get_parent().add_child(ball)
	
	if ball is RigidBody2D:
		# Устанавливаем начальную скорость
		var arc_velocity = Vector2(1200, -350)
		ball.linear_velocity = arc_velocity
	else:
		print("Ошибка: Корневой узел ball.tscn должен быть RigidBody2D")
