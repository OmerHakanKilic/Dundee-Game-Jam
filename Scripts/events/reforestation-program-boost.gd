extends Event

func description() -> String:
	return "A major reforestation initiative aimed at restoring natural habitats and improving air quality is proposed. Increase its funding?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/reforestation-program-boost.png")

func minimum_turn() -> int:
	return GlobalVariables.midgameStart

func maximum_turn() -> int:
	return GlobalVariables.lategameStart

func approve_effect():
	GlobalVariables.climate += 25
	GlobalVariables.popularity += 20
	GlobalVariables.treasury -= 15

func refuse_effect():
	GlobalVariables.climate -= 25
	GlobalVariables.popularity -= 20
	GlobalVariables.treasury += 15

func weight() -> float:
	return 0.45
