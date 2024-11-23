extends Node2D

func _process(delta):
	$CharacterBody2D.position.x+=250*delta
