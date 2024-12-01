extends TextureButton

func _on_pressed():
	Global.reload_main_scene=1
	$PauseTable.show()
	get_tree().paused=true
	
