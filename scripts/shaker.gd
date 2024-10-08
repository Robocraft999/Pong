extends Node2D
class_name Shaker

@export_range(0.0, 50.0, 1, "or_greater")    var shake_decay_rate := 1.0
@export_range(1.0, 50.0, 1, "or_greater")    var shake_roughness  := 50
@export_range(0.0, 100.0, 1.0, "or_greater") var shake_strength   := 0.0
@export var shake_x          := true
@export var shake_y          := true
@export var target: NodePath  = "."

@onready var noise = FastNoiseLite.new()

var noise_index := 0
var last_offset := Vector2.ZERO

func get_shake():
	noise_index += shake_roughness
	
	return Vector2(
		noise.get_noise_2d(0., noise_index) if shake_x else 0.0,
		noise.get_noise_2d(100.0, noise_index) if shake_y else 0.0
	)


func _process(delta: float) -> void:
	if OptionsManager.enable_screen_shake:
		var target_node = get_node(target)
		shake_strength = lerp(shake_strength, 0.0, shake_decay_rate * delta)

		target_node.position -= last_offset
		last_offset = get_shake() * shake_strength
		target_node.position += last_offset
	else:
		if last_offset != Vector2.ZERO:
			var target_node = get_node(target)
			target_node.position -= last_offset
			last_offset = Vector2.ZERO
	
