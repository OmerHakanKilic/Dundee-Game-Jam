extends Event

func description() -> String:
	return "Months of weak diplomacy have left your nation isolated. With Global Leadership below 30, foreign partners distance themselves, and international opportunities dry up."

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/the-world-turns-away.png")

func condition() -> bool:
	return GlobalVariables.leadership < 30

func approve_effect():
	GlobalVariables.leadership -= 15
	GlobalVariables.popularity -= 10
	GlobalVariables.treasury -= 5

func refuse_effect():
	GlobalVariables.leadership -= 15
	GlobalVariables.popularity -= 10
	GlobalVariables.treasury -= 5

# Modifier: -3 Popularity for the next three events

func weight() -> float:
	return 1.0
