extends Event

func description() -> String:
	return "The success of your green infrastructure push has inspired city councils to propose a comprehensive urban transit upgrade. Do you authorize additional funding to modernize bus and rail networks?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/urban-transit-revamp.png")

func condition() -> bool:
	return GlobalVariables.flags.has("green_infrastructure")

func approve_effect():
	GlobalVariables.climate += 10
	GlobalVariables.popularity += 15
	GlobalVariables.treasury -= 10
	GlobalVariables.leadership += 5
	GlobalVariables.flags["urban_transit"] = true
	
func refuse_effect():
	GlobalVariables.popularity -= 10
	GlobalVariables.treasury += 10
	GlobalVariables.flags["urban_transit"] = true
	
# Modifier: Future urban policy events gain a 15% boost in likelihood

func weight() -> float:
	return 0.7
