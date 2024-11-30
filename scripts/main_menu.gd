extends Node2D

var buttons_step=0
var button_speed=600
var button_speed2=700
var main_settings_button_step=0
var settings_act="none"
var exit_game_bool=false
var angle=0

var current_fps_local=0
var current_qual_local=1
var volume=0

func exit_game(delta): #выход из игры
	if $Black.modulate.a<1.5:
		$Black.modulate.a+=1*delta
	else:
		get_tree().quit()

func _on_play_button_pressed():  #TODO добавить переходы
	get_tree().change_scene_to_file("res://scenes/levels_list.tscn")

func _on_exit_button_pressed(): #нажатие на кнопку выход
	exit_game_bool=true

func _on_settings_button_pressed(): #нажатие на кнопку настройки
	$settings_main/graphics_label.show()
	$settings_main/audio_label.show()
	$settings_main/back_label.show()
	
	$play_label.hide()
	$settings_label.hide()
	$exit_label.hide()

func _on_back_settings_main_button_pressed(): #нажатие на кнопку назад из главного меню настроек
	$settings_main/graphics_label.hide()
	$settings_main/audio_label.hide()
	$settings_main/back_label.hide()
	
	$play_label.show()
	$settings_label.show()
	$exit_label.show()

func _on_graphics_button_pressed(): #нажатие на кнопку графика
	$settings_main/graphics_label.hide()
	$settings_main/audio_label.hide()
	$settings_main/back_label.hide()
	
	$settings_graphics/graph_label.show()
	$settings_graphics/fps_label.show()
	$settings_graphics/back_label.show()

func _on_back_from_graphics_button_pressed(): #нажатие на кнопку назад из меню настроек графики
	$settings_main/graphics_label.show()
	$settings_main/audio_label.show()
	$settings_main/back_label.show()
	
	$settings_graphics/graph_label.hide()
	$settings_graphics/fps_label.hide()
	$settings_graphics/back_label.hide()

func _on_next_fps_pressed(): #увеличить фпс
	current_fps_local+=1
	if current_fps_local>Global.max_fps_in_list:
		current_fps_local=0
	Global.current_fps=Global.list_of_fps[current_fps_local]
	Engine.max_fps=Global.list_of_fps[current_fps_local]
	$settings_graphics/fps_label.text="ФПС: "+str(Global.current_fps)
	print("Set "+ str(Global.list_of_fps[current_fps_local])+", "+str(current_fps_local))

func _on_back_fps_pressed(): #уменьшить фпс
	current_fps_local-=1
	if current_fps_local<0:
		current_fps_local=Global.max_fps_in_list
	Global.current_fps=Global.list_of_fps[current_fps_local]
	Engine.max_fps=Global.list_of_fps[current_fps_local]
	$settings_graphics/fps_label.text="ФПС: "+str(Global.current_fps)
	print("Set "+ str(Global.list_of_fps[current_fps_local])+", "+str(current_fps_local))

func _on_next_qual_pressed(): #увеличить качество графики
	current_qual_local+=1
	print(current_qual_local)
	if current_qual_local>Global.max_qual:
		current_qual_local=0
		print("Qual reset")
	Global.current_qual=Global.list_of_quality[current_qual_local]
	$settings_graphics/graph_label.text="КАЧЕСТВО: "+Global.current_qual
	print("Set "+ str(Global.current_qual)+ str(current_qual_local))
	
func _on_back_qual_pressed(): #уменьшить качество графики
	current_qual_local-=1
	if current_qual_local<0:
		current_qual_local=Global.max_qual
	Global.current_qual=Global.list_of_quality[current_qual_local]
	$settings_graphics/graph_label.text="КАЧЕСТВО: "+Global.current_qual
	print("Set "+ str(Global.current_qual))

func _on_audio_button_pressed(): #нажатие на кнопку аудио
	$settings_main/graphics_label.hide()
	$settings_main/audio_label.hide()
	$settings_main/back_label.hide()
	
	$settings_audio/music_label.show()
	$settings_audio/sound_label.show()
	$settings_audio/back_label.show()

func _on_back_from_audio_button_pressed(): #нажатие на кнопку назад из меню настроек аудио
	$settings_main/graphics_label.show()
	$settings_main/audio_label.show()
	$settings_main/back_label.show()
	
	$settings_audio/music_label.hide()
	$settings_audio/sound_label.hide()
	$settings_audio/back_label.hide()

func _on_next_music_pressed(): #увеличение громкости музыки
	Global.current_volume_music = min(Global.current_volume_music + 10, 100)
	var music_bus_index = AudioServer.get_bus_index("music")
	if music_bus_index != -1:
		var volume_m_db = Global.mindb + (Global.maxdb - Global.mindb) * (Global.current_volume_music / 100.0)
		AudioServer.set_bus_volume_db(music_bus_index, volume_m_db)
		$settings_audio/music_label.text = "МУЗЫКА: " + str(Global.current_volume_music)
		print(volume_m_db, " дБ")
	else:
		print("Шина 'music' не найдена!")

func _on_back_music_pressed(): # уменьшение громкости музыки
	Global.current_volume_music = max(Global.current_volume_music - 10, 0)
	var music_bus_index = AudioServer.get_bus_index("music")
	if music_bus_index != -1:
		var volume_m_db = Global.mindb + (Global.maxdb - Global.mindb) * (Global.current_volume_music / 100.0)
		AudioServer.set_bus_volume_db(music_bus_index, volume_m_db)
		$settings_audio/music_label.text = "МУЗЫКА: " + str(Global.current_volume_music)
		print(volume_m_db, " дБ")
	else:
		print("Шина 'music' не найдена!")

func _on_next_sound_pressed(): #увеличение громкости звука
	Global.current_volume_sound = min(Global.current_volume_sound + 10, 100)
	var music_bus_index = AudioServer.get_bus_index("sound")
	if music_bus_index != -1:
		var volume_s_db = Global.mindb + (Global.maxdb - Global.mindb) * (Global.current_volume_sound / 100.0)
		AudioServer.set_bus_volume_db(music_bus_index, volume_s_db)
		$settings_audio/sound_label.text="ЗВУК: "+str(Global.current_volume_sound)
		print(volume_s_db, " дБ")
	else:
		print("Шина 'sound' не найдена!")
		
func _on_back_sound_pressed(): #уменьшение громкости звука
	Global.current_volume_sound = max(Global.current_volume_sound - 10, 0)
	var music_bus_index = AudioServer.get_bus_index("sound")
	if music_bus_index != -1:
		var volume_s_db = Global.mindb + (Global.maxdb - Global.mindb) * (Global.current_volume_sound / 100.0)
		AudioServer.set_bus_volume_db(music_bus_index, volume_s_db)
		$settings_audio/sound_label.text="ЗВУК: "+str(Global.current_volume_sound)
		print(volume_s_db, " дБ")
	else:
		print("Шина 'sound' не найдена!")

func _ready(): #при входе в сцену
	MusicHandler.play_music("symphony_of_destruction")
	$SysImage/CameraMenu.offset = Vector2.ZERO
	current_fps_local=Global.max_fps_in_list
	current_qual_local=1
	print(current_fps_local)
	$Black.modulate.a=1.5
	$Black.visible=true
	$SysImage.hide()
	print($SysImage/CameraMenu.position_smoothing_speed)
	$SysImage/CameraMenu.position_smoothing_speed=1
	
	$settings_graphics/fps_label.text="ФПС: "+str(Global.current_fps)
	$settings_graphics/graph_label.text="КАЧЕСТВО: "+Global.current_qual
	$settings_audio/music_label.text="МУЗЫКА: "+str(Global.current_volume_music)
	$settings_audio/sound_label.text="ЗВУК: "+str(Global.current_volume_sound)
	
	$ver_label.text="Версия "+ Global.ver
	
	$settings_graphics/graph_label/white_arrow_right.frame=0
	$settings_graphics/graph_label/white_arrow_left.frame=0
	$settings_graphics/fps_label/white_arrow_right.frame=0
	$settings_graphics/fps_label/white_arrow_left.frame=0
	
func _process(delta):
	angle += 3 * delta
	$Logo.rotation = 0.04 * sin(angle)
	if exit_game_bool==true:
		exit_game(delta)
	if exit_game_bool==false:
		if $Black.modulate.a>0:
			$Black.modulate.a-=1*delta
		else:
			$Black.modulate.a=0
