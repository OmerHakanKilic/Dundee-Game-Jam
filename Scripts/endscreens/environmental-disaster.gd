extends Event

func description() -> String:
	return "Environmental Disaster: The environment can no longer sustain itself. With the climate stat depleted, natural disasters ravage the land, marking the collapse of sustainable living."

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/environmental-disaster.png")

func condition() -> bool:
	return GlobalVariables.climate <= 0

func approve_effect():
	GlobalVariables.shouldReset = true

func refuse_effect():
	GlobalVariables.shouldReset = true

func weight() -> float:
	return -1.0
