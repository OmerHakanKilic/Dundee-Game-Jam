extends Event

func description() -> String:
	return "Results of a nuclear safety review has returned: it expresses glowing praises about the benefits of nuclear energy, but concludes in its final statements as unsafe. Do you wish to publish this?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/nuclear-safety-review-results.png")

func condition() -> bool:
	# This event only becomes available if the nuclear safety review has been commissioned and we're in midgame.
	return GlobalVariables.flags.has("commission_nuclear_safety_review")

func maximum_turn() -> int:
	# Assuming midgame events expire at the start of the late game.
	return GlobalVariables.endgameStart

func approve_effect():
	GlobalVariables.climate -= 5
	GlobalVariables.popularity += 15
	GlobalVariables.treasury -= 5
	
func refuse_effect():
	GlobalVariables.popularity -= 10
	GlobalVariables.climate += 10
	
func weight() -> float:
	# 100% likelihood if the condition is met.
	return 1.0
