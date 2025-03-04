extends Event

func description() -> String:
	return "A regional conflict forces a massive influx of refugees into your nation. Do you open up your borders and offer aid to incoming refugees?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/refugee-influx.png")

func condition() -> bool:
	return true

func approve_effect():
	GlobalVariables.leadership += 10
	GlobalVariables.popularity += 15
	GlobalVariables.treasury -= 20
	GlobalVariables.flags["refugee_crisis"] = true
	
func refuse_effect():
	GlobalVariables.leadership -= 10
	GlobalVariables.popularity -= 15
	GlobalVariables.flags["refugee_crisis"] = true
	
func weight() -> float:
	return 0.45
