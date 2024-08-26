extends Line2D

var is_mouse_hovered : bool = false
@onready var string_joint: DampedSpringJoint2D = $StringJoint
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
static var instantiated_line : Line2D
var col_shape : SegmentShape2D
var connected_button : Node2D
var parent_button : Node2D

func _ready() -> void:
	col_shape = collision_shape_2d.shape
	parent_button = get_parent()
	string_joint.node_a = parent_button.get_path()

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("destroy_string")) or (Input.is_action_just_released("add_string") and (string_joint.node_a == null or string_joint.node_b.is_empty())):
		instantiated_line = null
		queue_free()
	if Input.is_action_pressed("add_string") and string_joint.node_b.is_empty():
		set_point_position(1, to_local(get_global_mouse_position()))
	if (!string_joint.node_b.is_empty()) :
		set_point_position(1, to_local(connected_button.position))
	col_shape.b = get_point_position(1)

func _on_area_2d_mouse_entered() -> void:
	is_mouse_hovered = true

func _on_area_2d_mouse_exited() -> void:
	is_mouse_hovered = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is ClotheButton and parent_button != body and connected_button == null:
		string_joint.node_b = body.get_path()
		string_joint.length = position.distance_to(body.position)/2
		connected_button = body
		if instantiated_line != null :
			instantiated_line.queue_free()
		instantiated_line = self
