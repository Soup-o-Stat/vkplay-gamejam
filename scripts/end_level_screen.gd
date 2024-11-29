extends CanvasLayer

var main_text=["КРУТО!", "ОГО!", "ЗАМЕЧАТЕЛЬНО!", "УХТЫШЕЧКА!", "ВЕЛИКОЛЕПНО!", "НЕПЛОХО!", "ОТЛИЧНО!", "ЕПОНА МАТЬ"]
var sound_played=false

func _ready():
	$EndLevelTable.position.y=-300
	var main_text_chance=randi()%8
	$EndLevelTable/main_label.text=main_text[main_text_chance]
	
func _process(delta):
	if Global.level_clear==1:
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
