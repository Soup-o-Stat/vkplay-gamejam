extends TextureButton

func _on_pressed():
	Global.choosen_ball=2
	$AnimatedSprite2D.visible=true
	$"../choose_first_button/AnimatedSprite2D".visible=false
	$"../choose_third_button/AnimatedSprite2D".visible=false
