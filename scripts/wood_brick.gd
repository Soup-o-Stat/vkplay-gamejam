extends RigidBody2D

var part=false

func disable_col():
	$CollisionShape2D.disabled=true
	$CollisionShape2D2.disabled=true
	$GPUParticles2D.emitting=true

func _process(delta):
	if self.part==true and $GPUParticles2D.emitting==false:
		self.queue_free()

func _on_area_2d_area_entered(area):
	if area.name.substr(0, 4)=="fire":
		if self.part==false:
			call_deferred("disable_col")
			$Sprite2D.hide()
			Global.score+=50
			$AudioStreamPlayer2D.play()
			self.part=true