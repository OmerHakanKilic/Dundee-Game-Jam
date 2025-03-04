extends Node2D

var event_scene=preload("res://Scenes/event.tscn")

var events = []

var swipe_amount = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	prepare_events()
	getEvent()

# This function iterates all script files in res://Scripts/events and loads them into the events array
# We assume all these files are valid events! There is no checking at this stage
func prepare_events():
		var dir = DirAccess.open("res://Scripts/events")
		if dir:
			dir.list_dir_begin()
			var file_name = dir.get_next()
			while file_name != "":
				print("Loaded event file:" + file_name)
				var evt = load("res://Scripts/events/" + file_name).new()
				events.append(evt)
				file_name = dir.get_next()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var currentEvent = get_child(4)
	currentEvent.position += Vector2(3.05,0.5) 
	

# This is a very basic demonstration of loading an event
# I think we should review the implementation here
func getEvent():
	var currentEvent=event_scene.instantiate()
	
	var eventimage = currentEvent.get_child(0)
	var eventlabel = currentEvent.get_child(1)
	
	eventimage.texture = events[0].image()
	eventlabel.text = "test"
	add_child(currentEvent)
