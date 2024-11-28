extends RigidBody2D

var part=false

func _ready():
	if Global.current_qual=="НИЗКОЕ":
		$GPUParticles2D.amount=100
	if Global.current_qual=="СРЕДНЕЕ":
		$GPUParticles2D.amount=500
		
func disable_col():
	$CollisionShape2D.disabled=true
	$CollisionShape2D2.disabled=true
	$CollisionShape2D3.disabled=true
	$CollisionShape2D4.disabled=true
	$CollisionShape2D5.disabled=true
	$CollisionShape2D6.disabled=true
	$CollisionShape2D7.disabled=true
	$CollisionShape2D8.disabled=true
	$CollisionShape2D9.disabled=true
	$CollisionShape2D10.disabled=true
	$CollisionShape2D11.disabled=true
	$CollisionShape2D12.disabled=true
	$CollisionShape2D13.disabled=true
	$CollisionShape2D14.disabled=true
	$CollisionShape2D15.disabled=true
	$CollisionShape2D16.disabled=true
	$CollisionShape2D17.disabled=true
	$CollisionShape2D18.disabled=true
	$CollisionShape2D20.disabled=true
	$CollisionShape2D21.disabled=true
	$CollisionShape2D22.disabled=true
	$CollisionShape2D23.disabled=true
	$CollisionShape2D27.disabled=true
	$CollisionShape2D28.disabled=true
	$GPUParticles2D.emitting=true

func _on_area_2d_body_entered(body):
	if body.name.substr(0, 4)=="ball":
		if self.part==false:
			call_deferred("disable_col")
			#disable_col()
			$Soloma1.hide()
			$AudioStreamPlayer.play()
			Global.score+=50
			self.part=true
		
func _process(delta):
	if self.part==true and $GPUParticles2D.emitting==false:
		self.queue_free()
