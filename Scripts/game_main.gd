extends Node2D

var event_scene=preload("res://Scenes/event.tscn")

var events = []
var already_triggered = {}

var swipe_offset = 0.0

var current_event
var next_event

var lose_screen = preload("res://Scripts/endscreens/lose-screen.gd").new()

var game_over = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	prepare_events()
	setup_event_scenes()
	position = get_viewport_rect().size  / 2

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

func begin_transition():
	card_transitioning = true
	
	var new_event = sample_event()
	setup_event(next_event, new_event)
	already_triggered[new_event] = true
	
	pass

func blank_next_event():
	#next_event.get_child(0).texture = placeholder_image
	next_event.get_child(1).text = ""

func finish_transition():
	card_transitioning = false
	swipe_offset = 0.0
	var temp = current_event
	current_event = next_event
	next_event = temp
	next_event.z_index = 0
	current_event.z_index = 1
	blank_next_event()

var card_transitioning = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	var swipe_detector = get_child(4)
	
	var threshold = 250.0
	var finish_threshold = 1000.0
	
	if !card_transitioning and swipe_detector.current_swipe_dir == "Left":
		swipe_offset = swipe_detector.current_swipe_amount * -1.0
		
		# Display the action prompt
	elif !card_transitioning and swipe_detector.current_swipe_dir == "Right":
		swipe_offset = swipe_detector.current_swipe_amount
		
		# Display the action prompt
	else:
		if card_transitioning == false:
			if swipe_offset > threshold:
				begin_transition()
			elif swipe_offset < -threshold:
				begin_transition()
		
		if card_transitioning == true:
			if swipe_offset < 0:
				swipe_offset -= delta*2500.0
			else:
				swipe_offset += delta*2500.0
				
			if abs(swipe_offset) > finish_threshold:
				finish_transition()
		else:		
			if swipe_offset < 0:
				swipe_offset = min(0,swipe_offset+delta*600.0)
			else:
				swipe_offset = max(0,swipe_offset-delta*600.0)
	
	current_event.position.x = swipe_offset
	
func setup_event(evt_scene, evt):
	var eventimage = evt_scene.get_child(0)
	var eventlabel = evt_scene.get_child(1)
	
	eventimage.texture = evt.image()
	eventlabel.text = evt.description()
	evt_scene.position = Vector2(0,0)

# This is a very basic demonstration of loading an event
# I think we should review the implementation here
func setup_event_scenes():
	current_event=event_scene.instantiate()
	next_event = event_scene.instantiate()
	
	current_event.z_index = 1
	next_event.z_index =0
	
	add_child(current_event)
	add_child(next_event)
	
	setup_event(current_event, events[0])
	already_triggered = {}
	already_triggered[events[0]] = true
	#setup_event(current_event, events[1])

func sample_event() -> Event:
	var sum_weights = 0
	for evt in events:
		if !already_triggered.has(evt) and evt.condition():
			sum_weights += evt.weight()
	var r = randf_range(0.0, sum_weights)
	sum_weights = 0
	for evt in events:
		if !already_triggered.has(evt) and evt.condition():
			sum_weights += evt.weight()
			if r < sum_weights:
				return evt
	
	# No events left, so it's game over
	game_over = true
	return lose_screen as Event
