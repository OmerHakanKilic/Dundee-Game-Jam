extends Event

func description() -> String:
	return "Congratulations, Prime Minister. You've recently been elected on a surge of popular enthusiasm. You are full of ideas and things can only be on the up from here."
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/downing-street.jpg")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true

func approve_effect():
	GlobalVariables.treasury -= 5
	GlobalVariables.popularity -= 5
	GlobalVariables.climate -= 5
	GlobalVariables.leadership -= 5
	
func refuse_effect():
	pass#GlobalVariables.shouldReset = true
	
func weight() -> float:
	# can read from globals to modify weight
	return -1.0
