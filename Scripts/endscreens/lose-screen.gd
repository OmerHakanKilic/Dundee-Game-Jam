extends Event

func description() -> String:
	return "BREAKING: WILDFIRE PR STUNT GONE WRONG - PM MISSING IN SCORCHED FOREST"
	
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

func approve_effect():
	GlobalVariables.shouldReset = true
	
func refuse_effect():
	GlobalVariables.shouldReset = true
	
func weight() -> float:
	# can read from globals to modify weight
	return 1.0
