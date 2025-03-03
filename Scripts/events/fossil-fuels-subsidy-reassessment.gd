extends Event

func description() -> String:
	return "Critics demand a reassessment of fossil fuel subsidies on both fiscal and environmental grounds. Call for a review?"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/fossil-fuels-subsidy-reassessment.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func weight() -> float:
	# can read from globals to modify weight
	return 1.0
