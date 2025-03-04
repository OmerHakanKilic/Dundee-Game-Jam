extends Event

func description() -> String:
	return "A popular environmental lobbying organisation has proposed a 50%  increase in taxes on long and short haul flights to reduce environmental impacts of air travel."
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/increase-tax-on-flights.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func maximum_turn() -> int:
	return GlobalVariables.midgameStart
	
func approve_effect():
	GlobalVariables.popularity -= 15
	GlobalVariables.treasury -= 10
	GlobalVariables.climate += 20
	
func refuse_effect():
	GlobalVariables.popularity += 10
	
func weight() -> float:
	# can read from globals to modify weight
	return 0.7
