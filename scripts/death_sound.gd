extends AudioStreamPlayer

func _play_death_sound(sound):
	bus="sound"
	var sound_to_play=load("res://media/sfx/sounds/"+str(sound)+".mp3")
	stream=sound_to_play
	pitch_scale=1.85
	play()
	print(stream, (" res://media/sfx/sounds/"+str(sound)+"mp3"))
	print("played")
