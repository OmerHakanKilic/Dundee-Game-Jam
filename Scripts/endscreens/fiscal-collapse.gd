extends Event

func description() -> String:
	return "Your nation’s treasury has plunged below critical levels. The ensuing collapse shatters markets, halts investments, and cripples public services. Economic chaos ripples through every sector, and international confidence plummets. You have lost the game."

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/financial-collapse.png")

func condition() -> bool:
	return GlobalVariables.treasury < 0

func maximum_turn() -> int:
	return 999

# Set both to game lost for either swipe? 
func approve_effect():
	GlobalVariables.gameLost = true

func refuse_effect():
	GlobalVariables.gameLost = true

func weight() -> float:
	return 1.0
