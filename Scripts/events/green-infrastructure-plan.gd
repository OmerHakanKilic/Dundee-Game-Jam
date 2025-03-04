extends Event

func description() -> String:
	return "A comprehensive plan to modernise transport and renewable energy infrastructure is ready. This investment could reshape regional connectivity and sustainability. Do you push it forward?"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/green-infrastructure-plan.png")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func maximum_turn() -> int:
	return GlobalVariables.midgameStart

func approve_effect():
	GlobalVariables.popularity +=10
	GlobalVariables.climate += 10
	GlobalVariables.treasury -= 5
	GlobalVariables.leadership += 10
	GlobalVariables.flags["green_infrastructure"] = true
	
func refuse_effect():	
	GlobalVariables.popularity -= 15
	GlobalVariables.treasury += 15
	
func weight() -> float:
	# can read from globals to modify weight
	return 0.6
