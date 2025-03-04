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

func date_from_turn() -> String:
	var year = 2020 + floor(GlobalVariables.currentTurn / 4)
	var month = int(GlobalVariables.currentTurn % 4)	
	var months = ["February", "May", "August", "November"]
	$MainContainer/Date.text = months[month] + " " + str(year)
	return str(year) + months[month]

# Called when the node enters the scene tree for the first time.
func _ready():
	var s =(get_viewport().size.x / 4) / 200.0
	scale =  Vector2(s,s)
	randomize()
	prepare_events()
	setup_event_scenes()
	reset()
	#position = get_viewport_rect().size  / 2

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
				
func reset():
	GlobalVariables.treasury = 30
	GlobalVariables.popularity = 40
	GlobalVariables.climate = 30
	GlobalVariables.leadership = 30
	GlobalVariables.currentTurn = 0
	GlobalVariables.flags = {}
	GlobalVariables.shouldReset = false
	current_event = events[0]
	current_event_scene.apply_event(current_event)
	already_triggered = {}
	already_triggered[current_event] = true	
	date_from_turn()

var treasury = 0.0
var popularity = 0.0
var leadership = 0.0
var climate = 0.0

func begin_transition():
	var change_treasury = GlobalVariables.treasury - treasury
	var change_popularity = GlobalVariables.popularity - popularity
	var change_climate = GlobalVariables.climate - climate
	var change_leadership = GlobalVariables.leadership - leadership
	
	var biggest_change = 1
	biggest_change = max(biggest_change,change_treasury)
	biggest_change = max(biggest_change,change_popularity)
	biggest_change = max(biggest_change,change_leadership)
	biggest_change = max(biggest_change,change_climate)
	
	var sound_to_play = null
	
	if abs(change_treasury) >= biggest_change:
		if change_treasury > 0 :
			sound_to_play = preload("res://Assets/Sounds/cash-register-kaching-sound-effect-125042.mp3")
		else:
			sound_to_play = preload("res://Assets/Sounds/paper-rip-slow-252618.mp3")
	elif abs(change_climate) >= biggest_change:
		if change_climate > 0:
			sound_to_play = preload("res://Assets/Sounds/bushmovement-6986.mp3")
		else:
			sound_to_play = preload("res://Assets/Sounds/chainsaw-start-218438.mp3")
	elif abs(change_leadership) >= biggest_change:
		if change_leadership > 0:
			sound_to_play = preload("res://Assets/Sounds/gavel-of-justice-124029.mp3")
		else:
			sound_to_play = preload("res://Assets/Sounds/police-siren-99029.mp3")
	elif abs(change_popularity) >= biggest_change:
		if change_popularity > 0:
			sound_to_play = preload("res://Assets/Sounds/small-applause-6695.mp3")
		else:
			sound_to_play = preload("res://Assets/Sounds/boo-6377.mp3")
	
	if sound_to_play != null:		
		$AudioStreamPlayer2D.stream = sound_to_play
		$AudioStreamPlayer2D.play()
	
	card_transitioning = true
	clamp_vars()
	next_event = sample_event()
	next_event.appear_effect()
	next_event_scene.apply_event(next_event)
	already_triggered[next_event] = true
	GlobalVariables.currentTurn += 1

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
	date_from_turn()
	if GlobalVariables.shouldReset == true:		
		reset()
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

var card_transitioning = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	var swipe_detector = get_child(0)
	
	var threshold = 250.0 #get_viewport_rect().size.x / 2.0
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
				current_event.approve_effect()
				begin_transition()
			# swipe right
			elif swipe_offset < -threshold:
				current_event.refuse_effect()
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
				
	var finish_fadeout = max(0.0,2.0*(abs(swipe_offset)-finish_threshold/2.0) / finish_threshold)
	$ApproveIcon.modulate.a = swipe_offset / threshold - finish_fadeout
	$RejectIcon.modulate.a = swipe_offset / (-threshold) - finish_fadeout
	
	current_event_scene.swipe_offset = swipe_offset
	#current_event_scene.rotation = rotate_amount
	#current_event_scene.position.x = swipe_offset

# This is a very basic demonstration of loading an event
# I think we should review the implementation here
func setup_event_scenes():
	current_event_scene=event_scene.instantiate()
	next_event_scene = event_scene.instantiate()
	
	current_event_scene.z_index = -1
	next_event_scene.z_index = -2
	
	blank_next_event()
	next_event_scene.position.x = -2000
	
	$MainContainer/MarginContainer.add_child(current_event_scene)
	$MainContainer/MarginContainer.add_child(next_event_scene)
	
	
	#setup_event(current_event, events[1])

func sample_event() -> Event:
	var sum_weights = 0
	var turn = GlobalVariables.currentTurn
	for evt in events:
		if !already_triggered.has(evt) and evt.condition() and turn >= evt.minimum_turn() and turn < evt.maximum_turn():
			sum_weights += evt.weight()
	var r = randf_range(0.0, sum_weights)
	sum_weights = 0
	for evt in events:
		if !already_triggered.has(evt) and evt.condition() and turn >= evt.minimum_turn() and turn < evt.maximum_turn():
			sum_weights += evt.weight()
			if r < sum_weights:
				return evt
	
	# No events left, so it's game over
	game_over = true
	return lose_screen as Event
