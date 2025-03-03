extends Node2D

var event_scene=preload("res://Scenes/event.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	getEvent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func getEvent():
	var currentEvent=event_scene.instantiate()
	add_child(currentEvent)
	currentEvent.constructor(GlobalVariables.currentEventId)
