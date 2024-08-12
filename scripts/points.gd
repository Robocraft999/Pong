extends Control

@onready var left_label: Label = $Left
var left_points = 0
@onready var right_label: Label = $Right
var right_points = 0

@onready var left_paddle: Paddle = $"../../Shaker/left"
@onready var right_paddle: Paddle = $"../../Shaker/right"
@onready var ball: Ball = $"../../Shaker/ball"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	left_label.text = "0"
	right_label.text = "0"

func _on_ball_out_of_bounds(left: bool) -> void:
	if not left:
		left_points += 1
		left_label.text = "%s" % left_points
	else:
		right_points += 1
		right_label.text = "%s" % right_points
		
	left_paddle.position = left_paddle.start_pos
	right_paddle.position = right_paddle.start_pos
	ball.init()
