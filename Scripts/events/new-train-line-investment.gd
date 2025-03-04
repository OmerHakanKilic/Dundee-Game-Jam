extends Event

func description() -> String:
	return "Your transport secretary has mentioned that trains between Manchester and London are consistently always booked at peak hours. and a survey of commuters want a new train line established."
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/new-train-line-investment.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true

func maximum_turn() -> int:
	return GlobalVariables.midgameStart

func approve_effect():
	GlobalVariables.treasury -= 10
	GlobalVariables.popularity += 20
	GlobalVariables.flags["fossil_fuel_reassessment"] = true
	
func refuse_effect():
	GlobalVariables.popularity -= 15
	
func weight() -> float:
	# can read from globals to modify weight
	return 0.8
