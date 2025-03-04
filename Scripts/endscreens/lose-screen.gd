extends Event

func description() -> String:
	return "Yeah you screwed up. We're doomed. Unlucky"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/forest_fire.jpg")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func appear_effect():
	GlobalVariables.treasury = 0
	GlobalVariables.popularity = 0
	GlobalVariables.climate = 0
	GlobalVariables.leadership = 0
	
func weight() -> float:
	# can read from globals to modify weight
	return 1.0
