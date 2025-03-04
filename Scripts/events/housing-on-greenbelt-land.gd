extends Event

func description() -> String:
	return "Limited housing developments on protected greenbelt areas are under consideration. Approve the development despite environmental risks?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/housing-development-on-greenbelt-land.png")

func minimum_turn() -> int:
	return GlobalVariables.midgameStart

func maximum_turn() -> int:
	return GlobalVariables.lategameStart

func approve_effect():
	GlobalVariables.climate -= 20
	GlobalVariables.popularity -= 15
	GlobalVariables.treasury += 40
	GlobalVariables.party_coalition_integrity -= 10
	
func refuse_effect():
	GlobalVariables.climate += 25
	GlobalVariables.popularity += 15
	
func weight() -> float:
	return 0.45
