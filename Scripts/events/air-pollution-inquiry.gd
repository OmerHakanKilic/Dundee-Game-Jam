extends Event

func description() -> String:
	return "A proposal has emerged for a public inquiry into rising air pollution levels in major cities, potentially exposing industrial malpractices. Initiate the inquiry?"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/air-pollution-inquiry.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func approve_effect():
	GlobalVariables.popularity += 15
	GlobalVariables.climate += 5
	GlobalVariables.treasury -= 5
	
func refuse_effect():	
	GlobalVariables.popularity -= 10
	GlobalVariables.climate -= 10
	GlobalVariables.treasury += 5
	
func weight() -> float:
	# can read from globals to modify weight
	return 0.9
