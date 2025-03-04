extends Event

func description() -> String:
	return "Public Outcry: Popular support has evaporated. With public trust at rock bottom, mass protests and social unrest have destabilised your government."

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/public-outcry.png")

func condition() -> bool:
	return GlobalVariables.popularity <= 0

func approve_effect():
	GlobalVariables.shouldReset = true

func refuse_effect():
	GlobalVariables.shouldReset = true

func weight() -> float:
	return -1.0
