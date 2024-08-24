extends Control

@onready var start_btn: Button = $StartBtn
@onready var reset_btn: Button = $ResetBtn
@onready var blue_button: ClotheButton
@onready var red_button: ClotheButton
@onready var clothe_buttons: Node = $"../ClotheButtons"

func _ready() -> void:
	blue_button = clothe_buttons.find_child("BlueButton")
	red_button = clothe_buttons.find_child("RedButton")

func _on_start_btn_pressed() -> void:
	start_btn.disabled = true
	blue_button.start()
	red_button.start()

func _on_reset_btn_pressed() -> void:
	get_tree().reload_current_scene()
