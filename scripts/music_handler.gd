extends AudioStreamPlayer

func play_music(music_name):
	bus="music"
	var sound_to_play=load("res://media/sfx/music/"+music_name+".mp3")
	stream=sound_to_play
	play()

func stop_music():
	stop_music()
