extends Line2D

var is_mouse_hovered : bool = false
@onready var string_joint: DampedSpringJoint2D = $StringJoint
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
var col_shape : SegmentShape2D
var connected_button : Node2D
var parent_button : Node2D

func _ready() -> void:
	col_shape = collision_shape_2d.shape
	string_joint.node_a = self.get_path()
	parent_button = get_parent()

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("destroy_string") and is_mouse_hovered) or (Input.is_action_just_released("add_string") and (string_joint.node_a == null or string_joint.node_b.is_empty())):
		queue_free()
	if Input.is_action_pressed("add_string") and string_joint.node_b.is_empty():
		set_point_position(1, to_local(get_global_mouse_position()))
		col_shape.b = get_point_position(1)
	if (!string_joint.node_b.is_empty()) :
		set_point_position(1, to_local(connected_button.position))
		col_shape.b = get_point_position(1)

func _on_area_2d_mouse_entered() -> void:
	print("mouse entered")
	is_mouse_hovered = true

func _on_area_2d_mouse_exited() -> void:
	print("mouse exited")
	is_mouse_hovered = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is ClotheButton and parent_button != body:
		string_joint.node_b = body.get_path()
		string_joint.length = parent_button.global_position.distance_to(body.global_position)
		print(string_joint.length)
		connected_button = body
