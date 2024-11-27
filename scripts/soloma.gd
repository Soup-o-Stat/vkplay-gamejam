extends RigidBody2D

var part=false

func _on_area_2d_body_entered(body):
	if body.name.substr(0, 4)=="ball":
		if self.part==false:
			$GPUParticles2D.emitting=true
			self.part=true
			$Soloma1.hide()
			$AudioStreamPlayer.play()
		
func _process(delta):
	if self.part==true and $GPUParticles2D.emitting==false:
		self.queue_free()
