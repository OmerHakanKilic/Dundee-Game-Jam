extends Event

func description() -> String:
	return "A high-cost initiative to invest in carbon capture technology promises to cut industrial emissions but will strain the treasury. Approve it?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/carbon-capture-initiative.png")

func minimum_turn() -> int:
	return GlobalVariables.midgameStart

func maximum_turn() -> int:
	return GlobalVariables.lategameStart

func approve_effect():
	GlobalVariables.climate += 15
	GlobalVariables.treasury -= 10
	GlobalVariables.global_leadership += 15
	GlobalVariables.flags["carbon_capture"] = true
	
func refuse_effect():
	GlobalVariables.climate -= 5
	GlobalVariables.treasury += 10
	GlobalVariables.popularity -= 5
	
func weight() -> float:
	return 0.75
