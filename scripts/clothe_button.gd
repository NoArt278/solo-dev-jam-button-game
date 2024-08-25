extends RigidBody2D

class_name ClotheButton

const BUTTON_BLUE = preload("res://assets/Button Blue.png")
const BUTTON_RED = preload("res://assets/Button Red.png")
const SEWING_STRING = preload("res://scenes/sewing_string.tscn")
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var is_blue : bool = true
var is_mouse_hovered : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (is_blue) :
		sprite_2d.texture = BUTTON_BLUE
	else :
		sprite_2d.texture = BUTTON_RED
	freeze = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("add_string") and is_mouse_hovered :
		var curr_sew_string = SEWING_STRING.instantiate()
		add_child(curr_sew_string)

func start() -> void:
	freeze = false

func _on_mouse_entered() -> void:
	is_mouse_hovered = true

func _on_mouse_exited() -> void:
	is_mouse_hovered = false
