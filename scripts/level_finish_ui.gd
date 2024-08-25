extends Control

static var curr_level = 1

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_next_level_button_pressed() -> void:
	curr_level += 1
	get_tree().change_scene_to_file("res://scenes/levels/level_" + str(curr_level) + ".tscn")
