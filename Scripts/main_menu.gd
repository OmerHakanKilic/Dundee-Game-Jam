extends Node2D



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:  # Check if the button is pressed (not released)
			if event.button_index == MOUSE_BUTTON_LEFT:  # Left mouse button
				get_tree().change_scene_to_file("res://Scenes/main.tscn")
			elif event.button_index == MOUSE_BUTTON_RIGHT:  # Right mouse button
				print("Right mouse button clicked at:", event.position)

func _on_exit_button_pressed():
	get_tree().quit()
