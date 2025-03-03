extends Event

func description() -> String:
	return "PLACEHOLDER EVENT DESCRIPTION"
	
func image() -> CompressedTexture2D:
	return preload("res://Assets/Images/Deepwater_Horizon_offshore_drilling_unit_on_fire_2010.jpg")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func weight() -> float:
	# can read from globals to modify weight
	return 1.0
