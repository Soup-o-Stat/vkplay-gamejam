extends RigidBody2D

var dead=false

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

func _ready():
	$AnimatedSprite2D.play()
