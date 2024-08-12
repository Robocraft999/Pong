extends Label

@export var format_string = "%.2f"
@export var history_size  = 15;
@onready var history = PackedFloat64Array()

var history_index: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if history.size() < history_size:
		history.append(delta)
	else:
		history[history_index] = delta
	history_index = (history_index + 1) % history_size
	
	var delta_sum := 0.
	for i in range(history.size()):
		delta_sum += history[i]
	
	var average_delta = delta_sum / history.size()
	
	self.text = format_string % (1 / average_delta)
