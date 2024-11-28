extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()
	$GPUParticles2D.emitting=true
	$AnimatedSprite2D.frame=0
	$AnimatedSprite2D.play()
	$AnimatedSprite2D2.hide()
	$AnimatedSprite2D3.hide()
	$AnimatedSprite2D4.hide()
	$AnimatedSprite2D5.hide()
	$GPUParticles2D2.emitting=true
	
func _process(delta):
	if $AnimatedSprite2D.frame==1:
		$AnimatedSprite2D2.frame=0
		$AnimatedSprite2D2.play()
		$AnimatedSprite2D2.show()
	if $AnimatedSprite2D.frame==3:
		$AnimatedSprite2D3.frame=0
		$AnimatedSprite2D3.play()
		$AnimatedSprite2D3.show()
	if $AnimatedSprite2D.frame==4:
		$AnimatedSprite2D4.frame=0
		$AnimatedSprite2D4.play()
		$AnimatedSprite2D4.show()
	if $AnimatedSprite2D.frame==5:
		$AnimatedSprite2D5.frame=0
		$AnimatedSprite2D5.play()
		$AnimatedSprite2D5.show()
		
	if $AnimatedSprite2D.frame==6:
		$AnimatedSprite2D.hide()
	if $AnimatedSprite2D2.frame==6:
		$AnimatedSprite2D2.hide()
	if $AnimatedSprite2D3.frame==6:
		$AnimatedSprite2D3.hide()
	if $AnimatedSprite2D4.frame==6:
		$AnimatedSprite2D4.hide()
	if $AnimatedSprite2D5.frame==6:
		$AnimatedSprite2D5.hide()
		queue_free()
