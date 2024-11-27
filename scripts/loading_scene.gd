extends Node2D

func _ready():
	print("Очистка памяти началась...")
	cleanup_memory()

func cleanup_memory():
	#var current_scene = get_tree().get_current_scene()
	##if current_scene:
		##current_scene.queue_free()
	#print("Удаление сцены завершено")
	##await get_tree().process_frame
	#print("Очистка завершена.")
	##var menu_scene = preload("res://scenes/main_menu.tscn").instantiate()
	##get_tree().root.add_child(menu_scene)
	##get_tree().set_current_scene(menu_scene)
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass
