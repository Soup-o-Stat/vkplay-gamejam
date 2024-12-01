extends Node2D

var cut_step=0

func _ready():
	$Label.visible_ratio=0

func change_step_param():
	if cut_step==1:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_texture_button_pressed():
	if $Label.visible_ratio!=1:
		$Label.visible_ratio=1
	else:
		cut_step+=1
		change_step_param()
		$Label.visible_ratio=0
	
func _process(delta):
	$Label.visible_ratio+=0.001
