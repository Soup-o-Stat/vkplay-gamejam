extends RigidBody2D

func _on_body_entered(body):
	print(body.name, " just touched")
	if body.name.substr(0, 8)=="ball_fire":
		self.name=="fire_brick"
		$GPUParticles2D.visible=true
		print("FIRE BRICK!!!")
	var sound_count=randi()%3
	if sound_count==0:
		$AudioStreamPlayer2D.stream=preload("res://media/sfx/sounds/rock_fall0.wav")
	if sound_count==1:
		$AudioStreamPlayer2D.stream=preload("res://media/sfx/sounds/rock_fall1.wav")
	if sound_count==2:
		$AudioStreamPlayer2D.stream=preload("res://media/sfx/sounds/rock_fall2.wav")
	#$AudioStreamPlayer2D.play()
	#print(body.name)

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name.substr(0, 8)=="ball_fire":
		self.name=="fire_brick"
		$GPUParticles2D.visible=true
		print("FIRE BRICK!!! shape")
