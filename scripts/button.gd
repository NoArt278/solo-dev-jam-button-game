extends RigidBody2D

class_name ClotheButton

const BUTTON_BLUE = preload("res://assets/Button Blue.png")
const BUTTON_RED = preload("res://assets/Button Red.png")
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var is_blue : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (is_blue) :
		sprite_2d.texture = BUTTON_BLUE
	else :
		sprite_2d.texture = BUTTON_RED
	freeze = true

func start() -> void:
	freeze = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	pass # Replace with function body.
