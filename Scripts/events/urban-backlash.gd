extends Event

func description() -> String:
	return "While many applaud the green upgrades, a vocal local community is protesting rapid changes to their familiar urban landscape. Do you engage in dialogue to ease tensions?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/urban_dialogue.png")

func condition() -> bool:
	return GlobalVariables.flags.has("green_infrastructure")

func minimum_turn() -> int:
	return GlobalVariables.endgameStart

func approve_effect():
	GlobalVariables.popularity += 5
	GlobalVariables.treasury -= 10
	GlobalVariables.climate -= 5

func refuse_effect():
	GlobalVariables.popularity -= 15

func weight() -> float:
	return 0.6
