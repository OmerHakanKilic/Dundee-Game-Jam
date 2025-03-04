extends Event

func description() -> String:
	return "Somehow, you finish your premiership and retire without a hitch. Good luck to whoever comes next!"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/survival.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func appear_effect():
	GlobalVariables.treasury = 100.0
	GlobalVariables.popularity =  100.0
	GlobalVariables.climate = 100.0
	GlobalVariables.leadership = 100.0

func approve_effect():
	GlobalVariables.shouldReset = true
	
func refuse_effect():
	GlobalVariables.shouldReset = true
	
func weight() -> float:
	# can read from globals to modify weight
	return -1.0
