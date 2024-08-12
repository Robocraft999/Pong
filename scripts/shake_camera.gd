extends Camera2D

@onready var noise = FastNoiseLite.new()
@onready var overlay_ui = $"../OverlayUI"

@export var NOISE_ADVANCE_SPEED := 30.0
@export var SHAKE_DECAY_RATE := 5.0

var shake_strength := 0.0
var noise_index := 0.

var shake_x := 1.
var shake_y := 1.

func get_noise():
	noise_index += NOISE_ADVANCE_SPEED
	
	return Vector2(
		noise.get_noise_2d(0.0, noise_index) * shake_x,
		noise.get_noise_2d(100.0, noise_index) * shake_y
	)

func _process(delta: float) -> void:
	shake_strength = lerp(shake_strength, 0.0, SHAKE_DECAY_RATE * delta)
	
	var shake_noise = get_noise() * shake_strength
	
	# Reset UI Shake
	overlay_ui.position -= offset
	
	# Shake camera, move UI accordingly
	offset = shake_noise
	overlay_ui.position += shake_noise
	
	pass


const shake_start_speed_threshold := 335.
func _paddle_on_ball_hit(ball_speed: float) -> void:
	shake_strength = 0.0 if ball_speed < shake_start_speed_threshold else ball_speed - shake_start_speed_threshold
	shake_x = 1.
	shake_y = 1.


func _on_ball_boundary_hit(ball_speed: float) -> void:
	shake_x = 0.
	shake_strength = 0.0 if ball_speed < shake_start_speed_threshold else ball_speed - shake_start_speed_threshold
