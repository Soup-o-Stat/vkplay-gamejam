extends RigidBody2D

var explode_var=false

func _ready():
	$AnimatedSprite2D.visible=false
	name = "ball_fire"

func _on_fire_area_area_entered(area):
	if area.name == "bonfire_area":
		call_deferred("explode")

func explode():
	$expl_col.disabled=false
	$AudioStreamPlayer.play()
	self.explode_var=true
	self.mass=10000
	self.gravity_scale=9999
	$AnimatedSprite2D.visible=true
	$AnimatedSprite2D.frame=0
	$AnimatedSprite2D.play
	$TestBall.visible=false
	print("explode")

func _process(delta):
	if self.explode_var==true and $AudioStreamPlayer.playing==false and $AnimatedSprite2D.frame==6:
		self.queue_free()
