extends Node2D

var cut_step=0

func _ready():
	$Label.visible_ratio=0

func change_step_param():
	if cut_step==1:
		$"1".visible=true
		$Label.text="Одна мысль уже давно не покидает мою голову: 'Бытие есть восприятие.' Как я могу знать, есть ли прошлое, если не могу его потрогать, услышать или разрушить? А если нет прошлого, то и настоящего просто нет. Я докажу прошлое, разрушив его. И тогда реальность настоящего тоже будет доказана."
	if cut_step==2:
		$"2".visible=true
		$Label.text="Материя распадается на осколки, за ней — прошлое этого мира, и оно ждёт моего доказательства. Да начнётся мой эксперимент! Если что-то можно разрушить, значит, оно существует. Бремя доказательств лежит на утверждающем — узрите моё доказательство!"
	if cut_step==3:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_texture_button_pressed():
	cut_step+=1
	change_step_param()
	$Label.visible_ratio=0
	
func _process(delta):
	$Label.visible_ratio+=0.0005
