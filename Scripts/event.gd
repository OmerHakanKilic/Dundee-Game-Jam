extends Node2D

class_name Event

var title:String

func description() -> String:
	return "PLACEHOLDER EVENT DESCRIPTION"
	
func image() -> CompressedTexture2D:
	return preload("res://Assets/Images/icon.svg")

func condition() -> bool:
	# can read from globals to see if conditions are met
	return true
	
func weight() -> float:
	# can read from globals to modify weight
	return 1.0
	
func approve_effect():
	pass

func refuse_effect():
	pass
	
func approve_prompt() -> String:
	return "Approve"

func refuse_prompt() -> String:
	return "Deny"
