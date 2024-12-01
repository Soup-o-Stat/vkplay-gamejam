extends TextureButton

var allowed_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~"

func replace_unicode_sequences(value: String) -> String:
	var result = value
	var regex = RegEx.new()
	regex.compile("\\\\u([0-9a-fA-F]{4})")
	var matches = regex.search_all(value)
	for match in matches:
		var codepoint = int("0x" + match.get_string(1))
		var unicode_char = char(codepoint)
		result = result.replace(match.get_string(0), unicode_char)
	return result

func url_encode(string: String) -> String:
	var encoded = ""
	var updated_string = replace_unicode_sequences(string)
	for char in updated_string:
		var char_code = char

		if char in allowed_chars:
			encoded += char
		else:
			encoded += "%" + str(char_code, 16).to_upper()

	return encoded
	
func share_to_vk():
	var base_url = "https://vk.com/share.php?"
	var text = str("Я прошел уровень "+str(Global.current_level)+" на "+str(Global.score)+" очков!")
	
	var full_url = base_url + "comment=" + (text)
	
	OS.shell_open(full_url)

func _on_pressed():
	share_to_vk()
