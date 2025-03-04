extends Event

func description() -> String:
	return "A group of lorry drivers have blockaded major national ports in protest to the fuel tax increases. The economy is at a standstill. Do you reduce fuel tax?"
	
func image() -> CompressedTexture2D:
	return load("res://Assets/Images/lorry_blockade.png")

func condition() -> bool:
	# check if the "Increase fuel tax" event has occurred
	# return GlobalVariables.increase_fuel_tax_occurred
	return true

func minimum_turn() -> int:
	return GlobalVariables.endgameStart

func approve_effect():
	# YES option: +10 Popularity, -5 Treasury, -5 Climate
	GlobalVariables.popularity += 10
	GlobalVariables.treasury -= 5
	GlobalVariables.climate -= 5

func refuse_effect():
	GlobalVariables.popularity -= 10
	GlobalVariables.climate += 10
	GlobalVariables.treasury -= 10

func weight() -> float:
	return 1.0
