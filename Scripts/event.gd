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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func constructor(ID:int):
	print(" Constructed with id: "+str(ID))
