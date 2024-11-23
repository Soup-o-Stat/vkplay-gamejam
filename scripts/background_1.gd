extends Node2D

func _ready():
	pass

func _process(delta):
	$ParallaxBackground/ParallaxLayer.motion_offset.x-=0.1
