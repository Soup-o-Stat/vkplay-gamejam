extends RigidBody2D

func _on_body_entered(body):
	var sound_count=randi()%3
	if sound_count==0:
		$AudioStreamPlayer2D.stream=preload("res://media/sfx/sounds/rock_fall0.wav")
	if sound_count==1:
		$AudioStreamPlayer2D.stream=preload("res://media/sfx/sounds/rock_fall1.wav")
	if sound_count==2:
		$AudioStreamPlayer2D.stream=preload("res://media/sfx/sounds/rock_fall2.wav")
	#$AudioStreamPlayer2D.play()
	print(body.name)
