extends RigidBody2D

var explode_var=false
var started=false
var explode_scene=load("res://scenes/fireball_explode.tscn")

func _ready():
	$AnimatedSprite2D.visible=false
	name = "ball_bomb"
	$Timer.start()
	self.started=true

func _on_fire_area_area_entered(area):
	if area.name == "bonfire_area":
		call_deferred("explode")

func explode():
	$expl_col.disabled=false
	self.explode_var=true
	self.mass=20
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
		#self.queue_free()
		pass
	if self.explode_var==false:
		if self.started==true:
			if $Timer.is_stopped():
				call_deferred("explode")
		
