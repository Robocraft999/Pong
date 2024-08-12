extends Area2D
class_name Ball

var speed: float = 300.

var direction: Vector2
@onready var extents_y: float = $Sprite2D.get_rect().size.y / 2. * $Sprite2D.global_scale.y
@onready var screen_size = get_viewport_rect().size
@onready var start_pos = position
@onready var shaker: Shaker = %Shaker
@onready var left_paddle: Paddle = %left
@onready var right_paddle: Paddle = %right

signal out_of_bounds(left: bool)

func _ready() -> void:
	randomize_direction()


const shake_start_speed_threshold := 335.
func _physics_process(delta: float) -> void:
	speed += speed * 0.05 * delta
	translate(direction * speed * delta)
	
func init():
	randomize_direction()
	speed = 300.
	position = start_pos
	
func randomize_direction():
	direction = (Vector2.LEFT if randf() < 0.5 else Vector2.RIGHT).rotated((randf()-0.5) * PI * 0.9)

func shake(shake_x: bool):
	shaker.shake_strength = 0.0 if speed < shake_start_speed_threshold else speed - shake_start_speed_threshold
	shaker.shake_x = shake_x
