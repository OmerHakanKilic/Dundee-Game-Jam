extends Event

func description() -> String:
	return "A backbencher has introduced a surprisingly popular bill to mandate a 5% per year increase in petrol tax to incentivise green transport."
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/increase-fuel-tax.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func maximum_turn() -> int:
	return GlobalVariables.midgameStart

func approve_effect():
	GlobalVariables.popularity -= 15
	GlobalVariables.treasury += 15
	GlobalVariables.climate += 10
	
func refuse_effect():
	GlobalVariables.popularity += 15
	
func weight() -> float:
	# can read from globals to modify weight
	return 0.7
