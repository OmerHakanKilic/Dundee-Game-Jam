extends TextureProgressBar

var target = 0.0
var current = 0.0

var change_rate = 75.0
var style

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	min_value = 0
	max_value = 100
	#style = StyleBoxFlat get_theme_stylebox("fill") as StyleBoxFlat


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current < target:
		current = min(current+delta*change_rate,target)
		tint_progress = Color.WEB_GREEN
		if current == target:
			tint_over = Color.WHITE_SMOKE
	elif current > target:
		tint_progress = Color.DARK_RED
		current = max(current-delta*change_rate,target)
	else:
		tint_progress = Color.WHITE_SMOKE
	
	value = current
