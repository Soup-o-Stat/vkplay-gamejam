extends RigidBody2D

var dead=false
var flip_var=0
var skin=0

func _on_area_2d_body_entered(body):
	if body.name.substr(0, 4)!="ball":
		if self.dead==false:
			DeathSound._play_death_sound("stone_death")
			queue_free()
			Global.score+=100
			Global.dead_enemies+=1
			print("Stone enemy is dead")
			self.dead=true

func _on_body_entered(body):
	if body.name.substr(0, 4)=="ball" or body.name.substr(0, 4)=="fire":
		if self.dead==false:
			DeathSound._play_death_sound("stone_death")
			queue_free()
			Global.score+=100
			Global.dead_enemies+=1
			print("Stone enemy is dead by ball")
			self.dead=true

func _on_area_2d_area_entered(area):
	if area.name.substr(0, 4)=="fire":
		if self.dead==false:
			DeathSound._play_death_sound("stone_death")
			queue_free()
			Global.score+=100
			Global.dead_enemies+=1
			print("Stone enemy is dead by fire")
			self.dead=true
	
	if area.name.substr(0, 6)=="poison":
		if self.dead==false:
			DeathSound._play_death_sound("stone_death")
			queue_free()
			Global.score+=100
			Global.dead_enemies+=1
			print("Stone enemy is dead by fire")
			self.dead=true

func _ready():
	self.flip_var=randi()%2
	if self.flip_var==0:
		pass
	if self.flip_var==1:
		$AnimatedSprite2D.flip_h=true
	$AnimatedSprite2D.play()
