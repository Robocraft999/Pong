extends Area2D
class_name Paddle

const SPEED = 300.0
var velocity = 0.0
var screen_size
var extents

@export var action_name_up: String
@export var action_name_down: String

@onready var shape: Sprite2D = $Sprite2D
@onready var start_pos = position

func _ready():    
	screen_size = get_viewport_rect().size
	extents = shape.get_rect().size.y/2 * shape.scale.y
	

func _physics_process(delta: float) -> void:

	var direction := Input.get_axis(action_name_up, action_name_down)
	if extents <= position.y and position.y <= (screen_size.y - extents):
		velocity = SPEED * delta * direction
	else:
		position.y = clamp(position.y, extents, screen_size.y - extents)
	
	translate(Vector2(0, velocity))
