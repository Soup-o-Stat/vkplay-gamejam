extends TextureButton

func _on_pressed():
	Global.reload_main_scene=1
	#get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://scenes/intro.tscn")
	
