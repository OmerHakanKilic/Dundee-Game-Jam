extends Event

func description() -> String:
	return "A charity, “Protect our Community”, has called for commissions into a nuclear safety review."
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/commission-nuclear-safety-review.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func maximum_turn() -> int:
	return GlobalVariables.midgameStart

func approve_effect():
	GlobalVariables.popularity += 10
	GlobalVariables.treasury -= 10
	
func refuse_effect():
	GlobalVariables.popularity -= 5
	
func weight() -> float:
	# can read from globals to modify weight
	return 0.7
