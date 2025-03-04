extends VBoxContainer

var swipe_offset = 0

func _process(delta : float) -> void:
	var rotate_amount = deg_to_rad(clamp(swipe_offset/100,-35.0,35.0))
	rotation = rotate_amount
	position.x = swipe_offset
	
func apply_event(evt : Event):
	var eventimage = get_child(0)
	var eventlabel = get_child(1)
	
	eventimage.texture = evt.image()
	eventlabel.text = evt.description()
	
	var scale = max(0.5,720.0 / evt.image().get_width())
	#eventimage.scale = Vector2(scale,scale)	
	position = Vector2(0,0)#get_viewport().size / 2.0#Vector2(0,0)
	swipe_offset = 0.0
