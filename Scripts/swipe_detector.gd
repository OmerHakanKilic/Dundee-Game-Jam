extends Node2D

var swipe_distance = 100
var start_pos: Vector2
var swiping = false
var current_swipe_amount = 0
var current_swipe_dir = ""

func handle_swipe(release : bool):
	var delta = get_viewport().get_mouse_position() - start_pos
	current_swipe_amount = delta.length()
	if abs(delta.x) < abs(delta.y):
		if delta.y < 0: current_swipe_dir = "Up"
		else: current_swipe_dir = "Down"
	else:
		if delta.x < 0 : current_swipe_dir = "Left"
		else: current_swipe_dir = "Right"
	if delta.length() > swipe_distance:
		return

func _input(event: InputEvent):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.is_pressed():
			start_pos = event.position
			swiping = true
		else:
			swiping = false
			handle_swipe(true)
			current_swipe_dir = ""

func _process(delta : float):
	if swiping:
		handle_swipe(false)
