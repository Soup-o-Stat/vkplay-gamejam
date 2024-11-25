extends Node2D

func _ready():
	$ParallaxBackground/ParallaxLayer6/butterdino.play()
	$ParallaxBackground/ParallaxLayer6/butterdino2.play()
	$ParallaxBackground/ParallaxLayer6/butterdino3.play()
	$ParallaxBackground/ParallaxLayer5/dino_natural.play()
	$ParallaxBackground/ParallaxLayer5/dino_big.play()
	$ParallaxBackground/ParallaxLayer5/dino_jump1.play()
	$ParallaxBackground/ParallaxLayer5/dino_jump2.play()

func _process(delta):
	$ParallaxBackground/ParallaxLayer.motion_offset.x-=0.1
	$ParallaxBackground/ParallaxLayer6.motion_offset.x-=0.7
