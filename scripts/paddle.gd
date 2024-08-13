extends Area2D
class_name Paddle

const SPEED = 300.0
var velocity = 0.0
var screen_size
var extents_y: float

@export var action_name_up: String
@export var action_name_down: String

@onready var shape: Sprite2D = $Sprite2D
@onready var start_pos = position
@onready var shaker: Shaker = $".."

func _ready():
	screen_size = get_viewport_rect().size
	extents_y = shape.get_rect().size.y/2.0 * shape.scale.y

func _physics_process(delta: float) -> void:

	var direction := Input.get_axis(action_name_up, action_name_down)
	var clamped_up = extents_y <= position.y or is_equal_approx(extents_y, position.y)
	var clamped_down = position.y <= (screen_size.y - extents_y) or is_equal_approx(position.y, screen_size.y - extents_y)
	if  clamped_up and clamped_down:
		velocity = SPEED * delta * direction
	
	translate(Vector2(0, velocity))
	position.y = clamp(position.y, extents_y, screen_size.y - extents_y)


func _on_area_entered(area: Area2D) -> void:
	if area is Ball:
		var ball: Ball = area
		var normal := Vector2.RIGHT if ball.direction.x < 0 else Vector2.LEFT
		var radians = normal.angle_to(ball.direction)
		var direction_out = normal.rotated(PI).rotated(-radians).rotated((randf()-0.5) * PI * 0.05)
		ball.direction = direction_out
		
		shaker.shake_strength = 0.0 if ball.speed < ball.shake_start_speed_threshold else ball.speed - ball.shake_start_speed_threshold
		shaker.shake_x = true
		shaker.shake_y = true
	
