extends Event

func description() -> String:
	return "Yeah you screwed up. We're doomed. Unlucky"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/forest_fire.jpg")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func weight() -> float:
	# can read from globals to modify weight
	return 1.0
