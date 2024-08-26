extends Control

func start_game():
	LevelFinish.curr_level = 1
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func back_to_main():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
