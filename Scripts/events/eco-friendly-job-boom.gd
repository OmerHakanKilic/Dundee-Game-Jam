extends Event

func description() -> String:
	return "The green infrastructure plan has spurred a surge in eco-friendly job creation."

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/eco-friendly-job-boom.png")

func condition() -> bool:
	return GlobalVariables.flags["green_infrastructure"]

func approve_effect():
	GlobalVariables.popularity += 10
	GlobalVariables.climate += 5
	GlobalVariables.treasury -= 5

func refuse_effect():
	GlobalVariables.popularity += 10
	GlobalVariables.climate += 5
	GlobalVariables.treasury -= 5

func weight() -> float:
	return 0.7
