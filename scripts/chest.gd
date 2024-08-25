extends StaticBody2D

class_name Chest

var is_blue_entered = false
var is_red_entered = false

signal level_finished

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is ClotheButton :
		if body.name == "BlueButton" :
			is_blue_entered = true
		else :
			is_red_entered = true
	if is_blue_entered and is_red_entered :
		level_finished.emit()
