extends Node2D

var enable_screen_shake = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func getSceneManager() -> SceneManager:
	return get_node("/root/root/SceneManager")
