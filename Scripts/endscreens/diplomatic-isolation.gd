extends Event

func description() -> String:
	return "Diplomatic Isolation: Your nation's global leadership has fallen to zero. International allies have abandoned you, leaving the country isolated and vulnerable to external threats."

func image() -> CompressedTexture2D:
	return load("res://Assets/Images/diplomatic-isolation.png")

func condition() -> bool:
	return GlobalVariables.global_leadership <= 0

func approve_effect():
	GlobalVariables.shouldReset = true

func refuse_effect():
	GlobalVariables.shouldReset = true

func weight() -> float:
	return -1.0
