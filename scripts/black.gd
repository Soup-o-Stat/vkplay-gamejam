extends ColorRect

var melting = false
var timer = 0.0 

@export var x_resolution := 100.0
@export var max_offset := 2.0
@export var melt_speed := 3

func _ready():
	pass

func _process(delta):
	if melting:
		timer += melt_speed*delta
		self.material.set_shader_parameter("timer", timer)
	elif Global.main_menu_start_melt:	
		start_melt()

func start_melt():
	var offsets = []
	for i in x_resolution:
		offsets.append(randf_range(1.0, max_offset))
	self.material.set_shader_parameter("y_offsets", offsets)
	
	var img = ("res://media/gfx/ui/black.png")
	self.material.set_shader_parameter("melting", true)
	melting = true
	Global.main_menu_start_melt=false
