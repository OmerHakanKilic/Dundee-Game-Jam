extends Event

func description() -> String:
	return "A charity, “Protect our Community”, has called for commissions into a nuclear safety review."
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/commission-nuclear-safety-review.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func weight() -> float:
	# can read from globals to modify weight
	return 1.0
