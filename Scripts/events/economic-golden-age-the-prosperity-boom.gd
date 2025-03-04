extends Event

func description() -> String:
	return "With Treasury income soaring, your nation basks in a rare period of economic prosperity. The financial windfall boosts investor confidence and sparks domestic innovation."

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/economic-golden-age-the-prosperity-boom.png")

func condition() -> bool:
	return GlobalVariables.treasury > 80

func approve_effect():
	GlobalVariables.popularity += 15
	GlobalVariables.leadership += 15

func refuse_effect():
	GlobalVariables.popularity += 15
	GlobalVariables.leadership += 15

# Modifier: Any future economic events that increase Treasury increases further by 5

func weight() -> float:
	return 1.0
