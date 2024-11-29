extends CanvasLayer

var main_text=["КРУТО!","ХОРОШО!", "ОГО!", "ЗАМЕЧАТЕЛЬНО!", "УХТЫШЕЧКА!", "ВЕЛИКОЛЕПНО!", "НЕПЛОХО!", "ОТЛИЧНО!", "ЕПОНА МАТЬ"]
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
	var main_text_chance=randi()%9
	$EndLevelTable/main_label.text=main_text[main_text_chance]
	
func _process(delta):
	if Global.high_score_reached==2 and Global.level_clear==1:
		write_high_score()
	if Global.level_clear==1:
		$EndLevelTable/level_label.text="Уровень "+str(Global.current_level)+" пройден!"
		$EndLevelTable/Label.text="СЧЕТ: "+str(Global.score)
		if $EndLevelTable.position.y!=150:
			$EndLevelTable.position.y+=600*delta
		if $EndLevelTable.position.y>150:
			$EndLevelTable.position.y=150
		if $EndLevelTable.position.y==150:
			if sound_played==false:
				$AudioStreamPlayer.play()
				sound_played=true
			

func share_to_vk_simple(level_id: int):
	var base_url = "https://vk.com/share.php?"
	var text = "FUCK!!!!!!!!!!"
	
	var full_url = base_url + "wall=" + (text)
	
	OS.shell_open(full_url)
