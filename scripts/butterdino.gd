extends AnimatedSprite2D

func _process(delta):
	if frame==2 and $AudioStreamPlayer2D.playing==false:
		$AudioStreamPlayer2D.play()
