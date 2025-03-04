extends Event

func description() -> String:
	return "The reassessment of the fossil fuel subsidies has resulted in ministers calling for a major reduction in these subsidies. Do you agree?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/fossil_fuels_subsidy.png")

func condition() -> bool:
	# Check that the 'Fossil Fuels Subsidy Reassessment' event has occurred and was answered YES,
	# and that the current climate is below 40.
	# return GlobalVariables.fossil_fuels_subsidy_reassessment_yes and return GlobalVariables.climate < 40
	return GlobalVariables.flags.has("fossil-fuels-subsidy-reassessment") and GlobalVariables.climate < 40

func minimum_turn() -> int:
	return GlobalVariables.endgameStart

func approve_effect():
	GlobalVariables.treasury -= 10
	GlobalVariables.popularity += 10
	GlobalVariables.climate += 5

func refuse_effect():
	GlobalVariables.popularity -= 20

func weight() -> float:
	return 0.75
