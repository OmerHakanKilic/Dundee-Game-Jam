extends Event

func description() -> String:
	return "Environmental activists have called for a reduction in carbon emissions by banning cars with ICE engines. Do you accept?"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/ice-ban.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func maximum_turn() -> int:
	return GlobalVariables.midgameStart

func approve_effect():
	GlobalVariables.climate += 15
	GlobalVariables.treasury -= 5
	GlobalVariables.popularity -= 10
	GlobalVariables.flags["ICE_ban"] = true
	
func refuse_effect():
	pass
	
func weight() -> float:
	# can read from globals to modify weight
	return 0.75
