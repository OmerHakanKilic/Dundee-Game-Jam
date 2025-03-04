extends Event

func description() -> String:
	return "A viral contagion has reached your continent and is spreading rapidly, and global health organisations have declared a pandemic. Do you want to initiate a lockdown?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/pandemic-outbreak.png")

func minimum_turn() -> int:
	return GlobalVariables.midgameStart

func maximum_turn() -> int:
	return GlobalVariables.endgameStart

# Modifier: -2 Treasury over the five events

func approve_effect():
	GlobalVariables.flags["pandemic"] = true
	GlobalVariables.popularity += 10
	GlobalVariables.treasury -= 20

func refuse_effect():
	GlobalVariables.flags["pandemic"] = true
	GlobalVariables.popularity -= 15

func weight() -> float:
	return 0.2
