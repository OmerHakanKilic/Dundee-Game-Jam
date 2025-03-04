extends Event

func description() -> String:
	return "International pressure mounts as a major trade partner imposes sanctions on your nation. Do you wish to initiate reforms to restore credibility, or reject any international demands?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/international_reforms.png")

func condition() -> bool:
	# return GlobalVariables.the_world_turns_away_occurred
    return True

func minimum_turn() -> int:
	return GlobalVariables.endGameStart

func approve_effect():
	GlobalVariables.global_leadership += 15
	GlobalVariables.popularity += 10
	GlobalVariables.treasury -= 15

func refuse_effect():
	GlobalVariables.global_leadership -= 20
	GlobalVariables.popularity -= 15

func weight() -> float:
	return 0.65
