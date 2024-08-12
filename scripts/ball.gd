extends Area2D
class_name Ball

var speed: float = 300.

var direction: Vector2
@onready var extents_y: float = $Sprite2D.get_rect().size.y / 2. * $Sprite2D.global_scale.y
@onready var screen_size = get_viewport_rect().size
@onready var start_pos = position

signal out_of_bounds(left: bool)

func _ready() -> void:
	randomize_direction()

func _physics_process(delta: float) -> void:
	speed += speed * 0.005 * delta
	translate(direction * speed * delta)
	
	# ceiling
	if position.y <= extents_y or is_equal_approx(extents_y, position.y) \
		or position.y >= (screen_size.y - extents_y) or is_equal_approx(position.y, screen_size.y - extents_y):
		direction.y *= -1
		pass
	pass
	
	# boundry
	if position.x < -10 or position.x > screen_size.x + 10:
		out_of_bounds.emit(position.x < 0)
	
func init():
	randomize_direction()
	speed = 300.
	position = start_pos
	
func randomize_direction():
	direction = Vector2.LEFT if randf() < 0.5 else Vector2.RIGHT
