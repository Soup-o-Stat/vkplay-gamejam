extends TextureButton

func _on_pressed():
	Global.choosen_ball=3
	$"../choose_first_button/AnimatedSprite2D".visible=false
	$"../choose_second_button/AnimatedSprite2D".visible=false
	$AnimatedSprite2D.visible=true
