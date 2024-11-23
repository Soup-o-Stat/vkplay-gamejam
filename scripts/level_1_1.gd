extends Node2D

var level_modulate_speed=1

func level_name_modulate(delta):
	if $ColorRect.modulate.a>0:
		$ColorRect.modulate.a-=level_modulate_speed*delta

func _ready():
	$ColorRect.visible=true
	$ColorRect.modulate.a=2

func _process(delta):
	level_name_modulate(delta)
