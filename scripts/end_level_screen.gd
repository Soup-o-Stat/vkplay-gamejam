extends CanvasLayer

var main_text=["КРУТО!","ХОРОШО!", "ОГО!", "ЗАМЕЧАТЕЛЬНО!", "УХТЫШЕЧКА!", "ВЕЛИКОЛЕПНО!", "НЕПЛОХО!", "ОТЛИЧНО!"]
var sound_played=false

func write_high_score():
	if Global.current_location==1:
		if Global.current_level==1:
			Global.high_score_1_1=Global.score
		if Global.current_level==2:
			Global.high_score_1_2=Global.score
		if Global.current_level==3:
			Global.high_score_1_3=Global.score
		if Global.current_level==4:
			Global.high_score_1_4=Global.score
		if Global.current_level==5:
			Global.high_score_1_5=Global.score
		if Global.current_level==6:
			Global.high_score_1_6=Global.score
		if Global.current_level==7:
			Global.high_score_1_7=Global.score
		if Global.current_level==8:
			Global.high_score_1_8=Global.score
	Global.high_score_reached==3

func _ready():
	$EndLevelTable.position.y=-300
	var main_text_chance=randi()%8
	$EndLevelTable/main_label.text=main_text[main_text_chance]
	
func _process(delta):
	if Global.current_location==1:
		if Global.current_level==1:
			if Global.score>=200 and Global.score<1250:
				Global.medal=0
			if Global.score>=1250 and Global.score<2250:
				Global.medal=1
			if Global.score>=2250:
				Global.medal=2
		if Global.current_level==2:
			if Global.score>=1100 and Global.score<3100:
				Global.medal=0
			if Global.score>=3100 and Global.score<4100:
				Global.medal=1
			if Global.score>=4100:
				Global.medal=2
		if Global.current_level==3:
			if Global.score>=600 and Global.score<700:
				Global.medal=0
			if Global.score>=700 and Global.score<1650:
				Global.medal=1
			if Global.score>=1650:
				Global.medal=2
		if Global.current_level==4:
			if Global.score>=400 and Global.score<1450:
				Global.medal=0
			if Global.score>=1450 and Global.score<2450:
				Global.medal=1
			if Global.score>=2450:
				Global.medal=2
		if Global.current_level==5:
			if Global.score>=400 and Global.score<1450:
				Global.medal=0
			if Global.score>=1450 and Global.score<3450:
				Global.medal=1
			if Global.score>=3450:
				Global.medal=2
		if Global.current_level==6:
			if Global.score>=500 and Global.score<1500:
				Global.medal=0
			if Global.score>=1500 and Global.score<2500:
				Global.medal=1
			if Global.score>=2500:
				Global.medal=2
		if Global.current_level==7:
			if Global.score>=400 and Global.score<1400:
				Global.medal=0
			if Global.score>=1400 and Global.score<2400:
				Global.medal=1
			if Global.score>=2400:
				Global.medal=2
		if Global.current_level==8:
			if Global.score>=700 and Global.score<2700:
				Global.medal=0
			if Global.score>=2700 and Global.score<4750:
				Global.medal=1
			if Global.score>=4750:
				Global.medal=2
	if Global.current_location==2:
		if Global.current_level==1:
			if Global.score>=300 and Global.score<1300:
				Global.medal=0
			if Global.score>=1300 and Global.score<2300:
				Global.medal=1
			if Global.score>=2300:
				Global.medal=2
		if Global.current_level==2:
			if Global.score>=300 and Global.score<500:
				Global.medal=0
			if Global.score>=500 and Global.score<1200:
				Global.medal=1
			if Global.score>=1200:
				Global.medal=2
		if Global.current_level==3:
			if Global.score>=700 and Global.score<1700:
				Global.medal=0
			if Global.score>=1700 and Global.score<2700:
				Global.medal=1
			if Global.score>=2700:
				Global.medal=2
		if Global.current_level==4:
			if Global.score>=400 and Global.score<500:
				Global.medal=0
			if Global.score>=500 and Global.score<1400:
				Global.medal=1
			if Global.score>=1400:
				Global.medal=2
		if Global.current_level==5:
			if Global.score>=400 and Global.score<1400:
				Global.medal=0
			if Global.score>=1400 and Global.score<2400:
				Global.medal=1
			if Global.score>=2400:
				Global.medal=2
		if Global.current_level==6:
			if Global.score>=400 and Global.score<1400:
				Global.medal=0
			if Global.score>=1400 and Global.score<2400:
				Global.medal=1
			if Global.score>=2400:
				Global.medal=2
		if Global.current_level==7:
			if Global.score>=400 and Global.score<2400:
				Global.medal=0
			if Global.score>=2400 and Global.score<3400:
				Global.medal=1
			if Global.score>=3400:
				Global.medal=2
		if Global.current_level==8:
			if Global.score>=600 and Global.score<2600:
				Global.medal=0
			if Global.score>=2600 and Global.score<3600:
				Global.medal=1
			if Global.score>=3600:
				Global.medal=2
	if Global.medal==0:
		$EndLevelTable/Bronze.modulate="#ffffff"
	if Global.medal==1:
		$EndLevelTable/Bronze.modulate="#ffffff"
		$EndLevelTable/Silver.modulate="#ffffff"
	if Global.medal==2:
		$EndLevelTable/Bronze.modulate="#ffffff"
		$EndLevelTable/Silver.modulate="#ffffff"
		$EndLevelTable/Gold.modulate="#ffffff"
	if Global.high_score_reached==2 and Global.level_clear==1:
		write_high_score()
	if Global.level_clear==1:
		$EndLevelTable/level_label.text="Уровень "+str(Global.current_level)+" пройден!"
		$EndLevelTable/Label.text="СЧЕТ: "+str(Global.score)
		if $EndLevelTable.position.y!=145:
			$EndLevelTable.position.y+=600*delta
		if $EndLevelTable.position.y>145:
			$EndLevelTable.position.y=145
		if $EndLevelTable.position.y==145:
			if sound_played==false:
				$AudioStreamPlayer.play()
				sound_played=true
			

func share_to_vk_simple(level_id: int):
	var base_url = "https://vk.com/share.php?"
	var text = "FUCK!!!!!!!!!!"
	
	var full_url = base_url + "wall=" + (text)
	
	OS.shell_open(full_url)
