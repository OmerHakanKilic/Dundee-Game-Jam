extends Event

func description() -> String:
	return "After recent severe floods, a proposal for an urgent upgrade to flood defences has been tabled. Allocate emergency funds?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/flood_defence.png")

func condition() -> bool:
	# Check that the "Climate Disaster: Flood" event has occurred
	# return  GlobalVariables.climate_disaster_flood_occurred
	return true

func minimum_turn() -> int:
	return GlobalVariables.endgameStart

func approve_effect():
	GlobalVariables.popularity += 15
	GlobalVariables.treasury -= 10

func refuse_effect():
	GlobalVariables.popularity -= 20

func weight() -> float:
	return 1.0
