extends RigidBody2D

var explode_var=false

var explode_scene=load("res://scenes/fireball_explode.tscn")

func _ready():
	$AnimatedSprite2D.visible=false
	name = "ball_fire"
	if Global.current_qual=="ВЫСОКОЕ":
		$GPUParticles2D.fixed_fps=60
	if Global.current_qual=="СРЕДНЕЕ":
		$GPUParticles2D.fixed_fps=30
	if Global.current_qual=="НИЗКОЕ":
		$PointLight2D.queue_free()
		$GPUParticles2D.queue_free()

func _on_fire_area_area_entered(area):
	if area.name == "bonfire_area":
		call_deferred("explode")

func explode():
	$expl_col.disabled=false
	self.explode_var=true
	self.mass=25
	self.gravity_scale=9999
	$AnimatedSprite2D.visible=true
	$AnimatedSprite2D.frame=0
	$AnimatedSprite2D.play
	$TestBall.visible=false
	print("explode")
	var explode = explode_scene.instantiate()
	explode.position = position
	get_parent().add_child(explode)
	

func _process(delta):
	if self.explode_var==true and $AnimatedSprite2D.frame==0:
		self.queue_free()
		
