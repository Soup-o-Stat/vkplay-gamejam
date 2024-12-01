extends TextureButton

func _on_pressed():
	MusicHandler.stop_music()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
