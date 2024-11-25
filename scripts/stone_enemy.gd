extends RigidBody2D

func _on_area_2d_body_entered(body):
	if body.name.substr(0, 4)!="ball":
		DeathSound._play_death_sound("stone_death")
		queue_free()
		Global.score+=100
		print("Stone enemy is dead")

func _on_body_entered(body):
	if body.name.substr(0, 4)=="ball":
		DeathSound._play_death_sound("stone_death")
		queue_free()
		Global.score+=100
		print("Stone enemy is dead by ball")
