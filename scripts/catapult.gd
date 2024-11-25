extends CharacterBody2D

var speed = 50
var go_right = false
var go_left = false

# Загрузка сцены камня
@onready var stone_scene = preload("res://scenes/ball.tscn")

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
		spawn_stone()

func spawn_stone():
	var stone = stone_scene.instantiate()
	stone.position = position-Vector2(0, 20)
	print(stone.position)
	get_parent().add_child(stone)
	if stone is RigidBody2D:
		var arc_velocity = Vector2(1200, -350)
		stone.linear_velocity = arc_velocity
	else:
		print("Ошибка: Корневой узел stone_brick_1.tscn должен быть RigidBody2D")
