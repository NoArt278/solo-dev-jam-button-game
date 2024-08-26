extends Control

class_name LevelFinish

static var curr_level = 1
const max_level = 5

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_next_level_button_pressed() -> void:
	curr_level += 1
	if curr_level <= max_level :
		get_tree().change_scene_to_file("res://scenes/levels/level_" + str(curr_level) + ".tscn")
	else :
		get_tree().change_scene_to_file("res://scenes/end.tscn")
