extends Event

func description() -> String:
	return "Less developed partners in the U.N. are asking for funding support for greener forms of energy. Do you accept?"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/support-undeveloped-nations.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func approve_effect():
	GlobalVariables.popularity -= 10
	GlobalVariables.treasury -= 10
	GlobalVariables.climate += 20
	GlobalVariables.leadership += 15
	GlobalVariables.flags["undeveloped_nation_aid"] = true
	
func refuse_effect():
	GlobalVariables.popularity += 10
	GlobalVariables.leadership -= 10
	
func weight() -> float:
	# can read from globals to modify weight
	return 1.0
