extends Event

func description() -> String:
	return "A major flood has affected large regions on the country, and has stopped transportation, and damaged to vital infrastructures."

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/climate-disaster-flood.png")

func minimum_turn() -> int:
	return GlobalVariables.midgameStart

func maximum_turn() -> int:
	return GlobalVariables.lategameStart

func condition() -> bool:
	return GlobalVariables.climate < 50

func approve_effect():
	GlobalVariables.treasury -= 15
	GlobalVariables.global_leadership -= 5

func refuse_effect():
	GlobalVariables.treasury -= 15
	GlobalVariables.global_leadership -= 5

func weight() -> float:
	return 0.65
