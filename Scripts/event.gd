extends Node2D

var title:String
var image
var description
var conditions=[]
var effects=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func constructor(ID:int):
	print(" Constructed with id: "+str(ID))
