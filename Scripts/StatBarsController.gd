extends BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_child(0).target = GlobalVariables.climate
	get_child(1).target = GlobalVariables.leadership
	get_child(2).target = GlobalVariables.treasury
	get_child(3).target = GlobalVariables.popularity
