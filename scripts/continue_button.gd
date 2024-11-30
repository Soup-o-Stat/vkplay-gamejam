extends TextureButton

func _on_pressed():
	if Global.current_location==1 and Global.first_max_levels>Global.current_level:
		var scene=load("res://scenes/level_1_"+str(Global.current_level+1)+".tscn")
		get_tree().change_scene_to_packed(scene)
	if Global.current_location==2 and Global.second_max_levels>Global.current_level:
		var scene=load("res://scenes/level_2_"+str(Global.current_level+1)+".tscn")
		get_tree().change_scene_to_packed(scene)
	else:
		#MusicHandler.play_music("symphony_of_destruction")
		#get_tree().change_scene_to_file("res://scenes/levels_list.tscn")
		print("exit")
