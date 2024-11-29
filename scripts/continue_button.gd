extends TextureButton

func _on_pressed():
	if Global.current_location==1 and Global.first_max_levels>Global.current_level:
		var scene=load("res://scenes/level_1_"+str(Global.current_level+1)+".tscn")
		get_tree().change_scene_to_packed(scene)
