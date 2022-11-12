extends Label

func format_time(time, digit_format = "%02d"):
	var digits = []

	var minutes = digit_format % [time / 60]
	digits.append(minutes)

	var seconds = digit_format % [int(ceil(time)) % 60]
	digits.append(seconds)

	var formatted = String()
	var colon = ":"

	for digit in digits:
		formatted += digit + colon

	if not formatted.empty():
		formatted = formatted.rstrip(colon)

	return formatted
	
func _process(delta):
	text = format_time(WorldManager.count_down)
