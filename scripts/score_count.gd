extends Label

var local_score=0
var scale_change=0
var high_score_reached=0
var high_score_played=0

func upscale():
	if scale_change==0:
		if scale>Vector2(1, 1):
			scale-=Vector2(0.1, 0.1)
	if scale_change==1:
		if scale<Vector2(1.5, 1.5):
			scale+=Vector2(0.1, 0.1)
		
func _process(delta):
	if Global.current_location==1:
		if Global.current_level==1:
			if local_score>Global.high_score_1_1:
				Global.high_score_reached=1
		if Global.current_level==2:
			if local_score>Global.high_score_1_2:
				Global.high_score_reached=1
		if Global.current_level==3:
			if local_score>Global.high_score_1_3:
				Global.high_score_reached=1
		if Global.current_level==4:
			if local_score>Global.high_score_1_4:
				Global.high_score_reached=1
		if Global.current_level==5:
			if local_score>Global.high_score_1_5:
				Global.high_score_reached=1
		if Global.current_level==6:
			if local_score>Global.high_score_1_6:
				Global.high_score_reached=1
		if Global.current_level==7:
			if local_score>Global.high_score_1_7:
				Global.high_score_reached=1
		if Global.current_level==8:
			if local_score>Global.high_score_1_8:
				Global.high_score_reached=1
	if Global.current_location==2:
		if Global.current_level==1:
			if local_score>Global.high_score_2_1:
				Global.high_score_reached=1
		if Global.current_level==2:
			if local_score>Global.high_score_2_2:
				Global.high_score_reached=1
		if Global.current_level==3:
			if local_score>Global.high_score_2_3:
				Global.high_score_reached=1
		if Global.current_level==4:
			if local_score>Global.high_score_2_4:
				Global.high_score_reached=1
		if Global.current_level==5:
			if local_score>Global.high_score_2_5:
				Global.high_score_reached=1
		if Global.current_level==6:
			if local_score>Global.high_score_2_6:
				Global.high_score_reached=1
		if Global.current_level==7:
			if local_score>Global.high_score_2_7:
				Global.high_score_reached=1
		if Global.current_level==8:
			if local_score>Global.high_score_2_8:
				Global.high_score_reached=1
	if local_score<Global.score:
		local_score+=1
		scale_change=1
		if $"../AudioStreamPlayer".playing==false:
			$"../AudioStreamPlayer".play()
	else:
		scale_change=0
	if Global.level_clear==1:
		local_score=Global.score
	if Global.high_score_reached==1:
		if high_score_played==0:
			$AudioStreamPlayer.play()
			high_score_played=1
		Global.high_score_reached=2
		add_theme_color_override("font_color", "#ffed00")
	text=("СЧЕТ: "+str(local_score))
	upscale()
