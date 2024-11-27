extends TextureButton

func _on_pressed():
	Global.reload_main_scene=1
	#get_tree().current_scene.free()
	get_tree().change_scene_to_file("res://scenes/loading_scene.tscn")
	
