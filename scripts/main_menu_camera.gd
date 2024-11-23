extends Camera2D

var shake_intensity =1
var shake_duration= 0.0
var start_set_speed=true
var shake_timer= 0.0
var original_offset: Vector2 = Vector2.ZERO
var random_seed: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready():
	original_offset = offset

func set_speed(delta):
	position_smoothing_speed=200*delta
	start_set_speed=false

func _process(delta):
	if start_set_speed==true:
		set_speed(delta)
	if shake_timer > 0.0:
		shake_timer -= delta
		offset = original_offset + Vector2(random_seed.randf_range(-0.3, 0.3) * shake_intensity, random_seed.randf_range(-0.3, 0.3) * shake_intensity) * delta * 60
	else:
		offset = original_offset

func start_shake(duration: float = 0.5, intensity: float = 10.0):
	shake_duration = duration
	shake_intensity = intensity
	shake_timer = shake_duration
