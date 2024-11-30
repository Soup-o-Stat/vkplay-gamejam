extends TextureButton

func _on_pressed():
	Global.reload_main_scene=1
	MusicHandler.stop_music()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
