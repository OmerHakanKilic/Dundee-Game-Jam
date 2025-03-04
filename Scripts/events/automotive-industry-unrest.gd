extends Event

func description() -> String:
	return "The ban on ICE vehicles has plunged traditional automotive manufacturers into crisis, sparking protests and job losses. Do you launch a support package to stabilise the industry and cushion its economic shock?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/automotive-industry-unrest.png")

func condition() -> bool:
	return GlobalVariables.flags.has("ICE_ban")

func approve_effect():
	GlobalVariables.popularity += 10
	GlobalVariables.treasury -= 15
	GlobalVariables.leadership += 5

func refuse_effect():
	GlobalVariables.popularity -= 15
	GlobalVariables.treasury += 10

func weight() -> float:
	return 0.65
