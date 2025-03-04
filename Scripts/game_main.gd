extends Node2D

var event_scene=preload("res://Scenes/event.tscn")

var events = []
var already_triggered = {}

var swipe_offset = 0.0

var current_event_scene
var next_event_scene

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
	clamp_vars()
	next_event = sample_event()
	setup_event(next_event_scene, next_event)
	already_triggered[next_event] = true
	
	pass

func clamp_vars():
	GlobalVariables.treasury = clamp(GlobalVariables.treasury,0,100)
	GlobalVariables.popularity = clamp(GlobalVariables.popularity,0,100)
	GlobalVariables.climate = clamp(GlobalVariables.climate,0,100)
	GlobalVariables.leadership = clamp(GlobalVariables.leadership,0,100)

func blank_next_event():
	#next_event.get_child(0).texture = placeholder_image
	next_event_scene.get_child(1).text = ""

func finish_transition():
	card_transitioning = false
	swipe_offset = 0.0
	var temp = current_event_scene
	current_event_scene = next_event_scene
	next_event_scene = temp
	next_event_scene.z_index = -2
	current_event_scene.z_index = -1
	current_event = next_event
	current_event_scene.rotation = 0
	next_event_scene.rotation = 0
	blank_next_event()

var card_transitioning = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	var swipe_detector = get_child(0)
	
	var threshold = get_viewport_rect().size.x / 2.0
	var finish_threshold = 1500.0
	
	if !card_transitioning and swipe_detector.current_swipe_dir == "Left":
		swipe_offset = swipe_detector.current_swipe_amount * -1.0		
		# Display the action prompt
	elif !card_transitioning and swipe_detector.current_swipe_dir == "Right":
		swipe_offset = swipe_detector.current_swipe_amount	
		# Display the action prompt
	else:
		if card_transitioning == false:
			# swipe left
			if swipe_offset > threshold:
				current_event.refuse_effect()
				begin_transition()
			# swipe right
			elif swipe_offset < -threshold:
				current_event.approve_effect()
				begin_transition()
		
		if card_transitioning == true:
			if swipe_offset < 0:
				swipe_offset -= delta*3000.0
			else:
				swipe_offset += delta*3000.0
				
			if abs(swipe_offset) > finish_threshold:
				finish_transition()
		else:		
			if swipe_offset < 0:
				swipe_offset = min(0,swipe_offset+delta*1500.0)
			else:
				swipe_offset = max(0,swipe_offset-delta*1500.0)
	
	var rotate_amount = deg_to_rad(clamp(swipe_offset/100,-35.0,35.0))
	current_event_scene.rotation = rotate_amount
	current_event_scene.position.x = swipe_offset
	
func setup_event(evt_scene, evt):
	var eventimage = evt_scene.get_child(0)
	var eventlabel = evt_scene.get_child(1)
	
	eventimage.texture = evt.image()
	eventlabel.text = evt.description()
	
	var scale = max(0.5,720.0 / evt.image().get_width())
	eventimage.scale = Vector2(scale,scale)	
	evt_scene.position = Vector2(0,0)

# This is a very basic demonstration of loading an event
# I think we should review the implementation here
func setup_event_scenes():
	current_event_scene=event_scene.instantiate()
	next_event_scene = event_scene.instantiate()
	
	current_event_scene.z_index = -1
	next_event_scene.z_index = -2
	
	add_child(current_event_scene)
	add_child(next_event_scene)
	
	current_event = events[0]
	setup_event(current_event_scene, current_event)
	already_triggered = {}
	already_triggered[current_event] = true
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
