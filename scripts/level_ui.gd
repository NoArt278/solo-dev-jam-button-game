extends Control

@onready var start_btn: Button = $StartBtn
@onready var reset_btn: Button = $ResetBtn
@onready var blue_button: ClotheButton
@onready var red_button: ClotheButton
@onready var clothe_buttons: Node = $"../ClotheButtons"
@onready var chest: Chest = $"../Chest"
@onready var level_finish_ui: Control = $"../LevelFinishUI"

func _ready() -> void:
	blue_button = clothe_buttons.find_child("BlueButton")
	red_button = clothe_buttons.find_child("RedButton")
	chest.level_finished.connect(level_finished)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") :
		get_tree().paused = not(get_tree().paused)

func _on_start_btn_pressed() -> void:
	start_btn.disabled = true
	blue_button.start()
	red_button.start()

func _on_reset_btn_pressed() -> void:
	get_tree().reload_current_scene()

func level_finished() -> void:
	level_finish_ui.visible = true
	visible = false
