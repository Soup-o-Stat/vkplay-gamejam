extends Node2D

var speed=50
var go_right=false
var go_left=false

func _process(delta):
	if go_right==true:
		$CharacterBody2D.position.x+=speed*delta
	elif go_left==true:
		$CharacterBody2D.position.x-=speed*delta
	
	$CharacterBody2D.move_and_slide()

func _on_arrow_right_button_button_down():
	go_right=true

func _on_arrow_right_button_button_up():
	go_right=false

func _on_arrow_left_button_button_down():
	go_left=true

func _on_arrow_left_button_button_up():
	go_left=false
	
