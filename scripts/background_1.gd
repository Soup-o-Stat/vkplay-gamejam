extends Node2D

var gyro_rotation = Input.get_gyroscope()

func _ready():
	$ParallaxBackground/ParallaxLayer6/butterdino.play()
	$ParallaxBackground/ParallaxLayer6/butterdino2.play()
	$ParallaxBackground/ParallaxLayer6/butterdino3.play()
	$ParallaxBackground/ParallaxLayer5/dino_natural.play()
	$ParallaxBackground/ParallaxLayer5/dino_big.play()
	$ParallaxBackground/ParallaxLayer5/dino_jump1.play()
	$ParallaxBackground/ParallaxLayer5/dino_jump2.play()
	
	if Global.current_qual!="ВЫСОКОЕ":
		$ParallaxBackground/ParallaxLayer2/StoneSky/light.queue_free()
		$ParallaxBackground/ParallaxLayer3/StoneSunset.material=null
	if Global.current_qual=="НИЗКОЕ":
		$ParallaxBackground/ParallaxLayer6/butterdino.queue_free()
		$ParallaxBackground/ParallaxLayer6/butterdino2.queue_free()
		$ParallaxBackground/ParallaxLayer6/butterdino3.queue_free()
		
func _process(delta):
	if Global.current_qual!="НИЗКОЕ":
		gyro_rotation = Input.get_gravity()
		
		$ParallaxBackground/ParallaxLayer2/StoneSky.position.y -= gyro_rotation.y*3*delta
		if $ParallaxBackground/ParallaxLayer2/StoneSky.position.y>155:
			$ParallaxBackground/ParallaxLayer2/StoneSky.position.y=155
		if $ParallaxBackground/ParallaxLayer2/StoneSky.position.y<133:
			$ParallaxBackground/ParallaxLayer2/StoneSky.position.y=133
		if gyro_rotation.x>0:
			$ParallaxBackground/ParallaxLayer.motion_offset.x+=0.3
		if gyro_rotation.x<0:
			$ParallaxBackground/ParallaxLayer.motion_offset.x-=0.3
		else:
			pass
		$ParallaxBackground/ParallaxLayer6.motion_offset.x-=0.7
