extends Label

var local_score=0
var scale_change=0
var high_score_reached=0

func upscale():
	if scale_change==0:
		if scale>Vector2(1, 1):
			scale-=Vector2(0.1, 0.1)
	if scale_change==1:
		if scale<Vector2(1.5, 1.5):
			scale+=Vector2(0.1, 0.1)
		

func _process(delta):
	if local_score<Global.score:
		local_score+=1
		scale_change=1
		if $"../AudioStreamPlayer".playing==false:
			$"../AudioStreamPlayer".play()
	else:
		scale_change=0
	if local_score>Global.high_score_1_1 and high_score_reached==0:
		$AudioStreamPlayer.play()
		high_score_reached=1
		add_theme_color_override("font_color", "#ffed00")
	text=("СЧЕТ: "+str(local_score))
	upscale()
