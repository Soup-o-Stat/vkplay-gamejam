extends RigidBody2D

var sharp = 0

@onready var miniball_scene = preload("res://scenes/ball_mini.tscn")

func _ready():
	name = "ball"

func _process(delta):
	if $Timer.is_stopped():
		if self.sharp != 3:
			var miniball = miniball_scene.instantiate()
			miniball.position = position - Vector2(0, 40)
			miniball.name = "ball"
			miniball.linear_velocity = self.linear_velocity 
			miniball.angular_velocity = self.angular_velocity

			get_parent().add_child(miniball)
			self.sharp += 1
		else:
			self.queue_free()
