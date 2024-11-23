extends Node2D

var buttons_step=0
var button_speed=600
var button_speed2=700
var main_settings_button_step=0
var settings_act="none"
var exit_game_bool=false

var current_fps_local=0
var current_qual_local=0
var volume=0

func exit_game(delta): #выход из игры
	if $Black.modulate.a<1.5:
		$Black.modulate.a+=1*delta
	else:
		get_tree().quit()

func buttons_move(delta): #основные кнопки меню летят вверх
	if buttons_step==0:
		if $play_label.position.y>140:
			$play_label.position.y-=button_speed*delta
		else:
			$play_label.position.y=140
			$buttons_sound.play()
			$SysImage/Camera2D.start_shake()
			buttons_step=1
	if buttons_step==1:
		if $settings_label.position.y>188:
			$settings_label.position.y-=button_speed*delta
		else:
			$settings_label.position.y=188
			$buttons_sound.play()
			$SysImage/Camera2D.start_shake()
			buttons_step=2
	if buttons_step==2:
		if $exit_label.position.y>236:
			$exit_label.position.y-=button_speed*delta
		else:
			$exit_label.position.y=236
			$buttons_sound.play()
			$SysImage/Camera2D.start_shake()
			Global.main_menu_start_melt=true
			$main_menu_music.play()
			buttons_step=3

func show_settigs(delta): #летит вверх (в зависимости от меню настроек)
	if settings_act=="graphics":
		if main_settings_button_step==7:
			if $settings_graphics/graph_label.position.y>140:
				$settings_graphics/graph_label.position.y-=button_speed*delta
			else:
				$settings_graphics/graph_label.position.y=140
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				main_settings_button_step=8
		if main_settings_button_step==8:
			if $settings_graphics/fps_label.position.y>188:
				$settings_graphics/fps_label.position.y-=button_speed*delta
			else:
				$settings_graphics/fps_label.position.y=188
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				main_settings_button_step=9
		if main_settings_button_step==9:
			if $settings_graphics/back_label.position.y>236:
				$settings_graphics/back_label.position.y-=button_speed*delta
			else:
				$settings_graphics/back_label.position.y=236
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				main_settings_button_step=10
	if settings_act=="audio":
		if main_settings_button_step==7:
			if $settings_audio/music_label.position.y>140:
				$settings_audio/music_label.position.y-=button_speed*delta
			else:
				$settings_audio/music_label.position.y=140
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				main_settings_button_step=8
		if main_settings_button_step==8:
			if $settings_audio/sound_label.position.y>188:
				$settings_audio/sound_label.position.y-=button_speed*delta
			else:
				$settings_audio/sound_label.position.y=188
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				main_settings_button_step=9
		if main_settings_button_step==9:
			if $settings_audio/back_label.position.y>236:
				$settings_audio/back_label.position.y-=button_speed*delta
			else:
				$settings_audio/back_label.position.y=236
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				main_settings_button_step=10
	if settings_act=="main":
		if main_settings_button_step==17:
			if $settings_main/graphics_label.position.y>140:
				$settings_main/graphics_label.position.y-=button_speed*delta
			else:
				$settings_main/graphics_label.position.y=140
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				main_settings_button_step=18
		if main_settings_button_step==18:
			if $settings_main/audio_label.position.y>188:
				$settings_main/audio_label.position.y-=button_speed*delta
			else:
				$settings_main/audio_label.position.y=188
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				main_settings_button_step=19
		if main_settings_button_step==19:
			if $settings_main/back_label.position.y>236:
				$settings_main/back_label.position.y-=button_speed*delta
			else:
				$settings_main/back_label.position.y=236
				$buttons_sound.play()
				$SysImage/Camera2D.start_shake()
				settings_act="none"
				main_settings_button_step=0

func main_settings_buttons_move(delta): #main летит вниз
	if main_settings_button_step==1:
		if $settings_main/graphics_label.position.y>131:
			$settings_main/graphics_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=2
			$button_slide_sound.play()
	if main_settings_button_step==2:
		if $settings_main/graphics_label.position.y<337:
			$settings_main/graphics_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=3
	if main_settings_button_step==3:
		if $settings_main/audio_label.position.y>178:
			$settings_main/audio_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=4
			$button_slide_sound.play()
	if main_settings_button_step==4:
		if $settings_main/audio_label.position.y<376:
			$settings_main/audio_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=5
	if main_settings_button_step==5:
		if $settings_main/back_label.position.y>224:
			$settings_main/back_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=6
			$button_slide_sound.play()
	if main_settings_button_step==6:
		if $settings_main/back_label.position.y<416:
			$settings_main/back_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=7

func audio_settings_buttons_move(delta): #audio летит вниз
	if main_settings_button_step==20:
		if $settings_audio/music_label.position.y>131:
			$settings_audio/music_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=21
			$button_slide_sound.play()
	if main_settings_button_step==21:
		if $settings_audio/music_label.position.y<337:
			$settings_audio/music_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=22
	if main_settings_button_step==22:
		if $settings_audio/sound_label.position.y>178:
			$settings_audio/sound_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=23
			$button_slide_sound.play()
	if main_settings_button_step==23:
		if $settings_audio/sound_label.position.y<376:
			$settings_audio/sound_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=24
	if main_settings_button_step==24:
		if $settings_audio/back_label.position.y>224:
			$settings_audio/back_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=25
			$button_slide_sound.play()
	if main_settings_button_step==25:
		if $settings_audio/back_label.position.y<416:
			$settings_audio/back_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=17
			settings_act="main"

func graph_settings_buttons_move(delta): #graph летит вниз
	if main_settings_button_step==11:
		if $settings_graphics/graph_label.position.y>131:
			$settings_graphics/graph_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=12
			$button_slide_sound.play()
	if main_settings_button_step==12:
		if $settings_graphics/graph_label.position.y<337:
			$settings_graphics/graph_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=13
	if main_settings_button_step==13:
		if $settings_graphics/fps_label.position.y>178:
			$settings_graphics/fps_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=14
			$button_slide_sound.play()
	if main_settings_button_step==14:
		if $settings_graphics/fps_label.position.y<376:
			$settings_graphics/fps_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=15
	if main_settings_button_step==15:
		if $settings_graphics/back_label.position.y>224:
			$settings_graphics/back_label.position.y-=button_speed2*delta
		else:
			main_settings_button_step=16
			$button_slide_sound.play()
	if main_settings_button_step==16:
		if $settings_graphics/back_label.position.y<416:
			$settings_graphics/back_label.position.y+=button_speed2*delta
		else:
			main_settings_button_step=17
			settings_act="main"

func _on_exit_button_pressed(): #нажатие на кнопку выход
	exit_game_bool=true

func _on_settings_button_pressed(): #нажатие на кнопку настройки
	$SysImage.position.x=965
	$slide_sound.play()

func _on_back_settings_main_button_pressed(): #нажатие на кнопку назад из главного меню настроек
	$SysImage.position.x=312
	$slide_sound.play()

func _on_graphics_button_pressed(): #нажатие на кнопку графика
	main_settings_button_step=1
	settings_act="graphics"

func _on_back_from_graphics_button_pressed(): #нажатие на кнопку назад из меню настроек графики
	main_settings_button_step=11

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
	if current_qual_local>Global.max_qual:
		current_qual_local=0
	Global.current_qual=Global.list_of_quality[current_qual_local]
	$settings_graphics/graph_label.text="КАЧЕСТВО: "+Global.current_qual
	print("Set "+ str(Global.current_qual))
	
func _on_back_qual_pressed(): #уменьшить качество графики TODO: надо, шоб эта залупа хоть на что-то влияла, а то как то не комильфо
	current_qual_local-=1
	if current_qual_local<0:
		current_qual_local=Global.max_qual
	Global.current_qual=Global.list_of_quality[current_qual_local]
	$settings_graphics/graph_label.text="КАЧЕСТВО: "+Global.current_qual
	print("Set "+ str(Global.current_qual))

func _on_audio_button_pressed(): #нажатие на кнопку аудио
	main_settings_button_step=1
	settings_act="audio"

func _on_back_from_audio_button_pressed(): #нажатие на кнопку назад из меню настроек аудио
	main_settings_button_step=20

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
	current_fps_local=Global.max_fps_in_list
	current_qual_local=Global.max_qual
	print(current_fps_local)
	$Black.modulate.a=0
	$Black.visible=true
	$SysImage.hide()
	
	$settings_graphics/fps_label.text="ФПС: "+str(Global.current_fps)
	$settings_graphics/graph_label.text="КАЧЕСТВО: "+Global.current_qual
	$settings_audio/music_label.text="МУЗЫКА: "+str(Global.current_volume_music)
	$settings_audio/sound_label.text="ЗВУК: "+str(Global.current_volume_sound)
	
	$ver_label.text="Версия "+Global.ver
	
	$settings_graphics/graph_label/white_arrow_right.frame=0
	$settings_graphics/graph_label/white_arrow_left.frame=0
	$settings_graphics/fps_label/white_arrow_right.frame=0
	$settings_graphics/fps_label/white_arrow_left.frame=0
	
func _process(delta): #основной цикл (неоптимизированный кал блять)
	buttons_move(delta)
	main_settings_buttons_move(delta)
	graph_settings_buttons_move(delta)
	audio_settings_buttons_move(delta)
	show_settigs(delta)
	if exit_game_bool==true:
		exit_game(delta)
