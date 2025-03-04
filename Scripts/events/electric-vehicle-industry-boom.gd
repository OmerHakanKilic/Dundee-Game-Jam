extends Event

func description() -> String:
	return "With the ICE ban in effect, the electric vehicle market surges. Industry leaders and innovators are calling for further investment in EV infrastructure to seize the new opportunity. Do you invest in expanding the EV network?"

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/electric-vehicle-industry-boom.png")

func condition() -> bool:
	return GlobalVariables.flags.has("ICE_ban")

func approve_effect():
	GlobalVariables.leadership += 20
	GlobalVariables.climate += 15
	GlobalVariables.popularity += 10
	GlobalVariables.treasury -= 10

func refuse_effect():
	GlobalVariables.leadership -= 10
	GlobalVariables.popularity -= 10
	GlobalVariables.treasury += 10

func weight() -> float:
	return 0.7
