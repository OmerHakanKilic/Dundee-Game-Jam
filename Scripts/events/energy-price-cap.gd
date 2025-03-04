extends Event

func description() -> String:
	return "As a result of the pandemic, energy bills have surged. A proposal for a government-imposed price cap is hotly debated. Introduce the cap?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/energy_price_cap.png")

func condition() -> bool:
	# return GlobalVariables.pandemic_outbreak_occurred
	return true

func minimum_turn() -> int:
	return GlobalVariables.endgameStart

func approve_effect():
	GlobalVariables.popularity += 15
	GlobalVariables.treasury -= 10

func refuse_effect():
	GlobalVariables.popularity -= 15

func weight() -> float:
	return 0.9
