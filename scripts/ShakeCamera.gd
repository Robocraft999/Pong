extends Camera2D

@onready var noise = FastNoiseLite.new()

@export var NOISE_ADVANCE_SPEED := 30.0
@export var SHAKE_DECAY_RATE := 5.0

var shake_strength := 0.0
var noise_index := 0.

func get_noise():
	noise_index += NOISE_ADVANCE_SPEED
	
	return Vector2(
		noise.get_noise_2d(0.0, noise_index),
		noise.get_noise_2d(100.0, noise_index)
	)

func _process(delta: float) -> void:
	shake_strength = lerp(shake_strength, 0.0, SHAKE_DECAY_RATE * delta)
	
	var shake_noise = get_noise() * shake_strength
	offset = shake_noise
	pass


const shake_start_speed_threshold := 335.
func _paddle_on_ball_hit(ball_speed: float) -> void:
	shake_strength = 0.0 if ball_speed < shake_start_speed_threshold else ball_speed - shake_start_speed_threshold
