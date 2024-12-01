extends Node2D

var cut_step=0

func _ready():
	$Label.visible_ratio=0

func change_step_param():
	if cut_step==1:
		$Label.text="Мир больше никогда не будет прежним: теперь разум покорил само время, ни одно пространство не скроется от чуткого взора наблюдателей."
	if cut_step==2:
		$Label.text="Но у меня на материю совсем другие планы..."
	if cut_step==3:
		$"1".visible=true
		$Label.text="Одна мысль уже давно не покидает мою голову: 'Бытие есть восприятие.' "
	if cut_step==4:
		$Label.text="Как я могу знать, есть ли прошлое, если не могу его потрогать, услышать или разрушить? А если нет прошлого, то и настоящего просто нет."
	if cut_step==5:
		$Label.text=" Я докажу прошлое, разрушив его. И тогда реальность настоящего тоже будет доказана."
	if cut_step==6:
		$"2".visible=true
		$Label.text="Материя распадается на осколки, за ней — прошлое этого мира, и оно ждёт моего доказательства."
	if cut_step==7:
		$Label.text="Да начнётся мой эксперимент! Если что-то можно разрушить, значит, оно существует. Бремя доказательств лежит на утверждающем — узрите моё доказательство!"
	if cut_step==8:
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
