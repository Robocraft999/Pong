extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CameraShakeButton.button_pressed = OptionsManager.enable_screen_shake

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_camera_shake_button_toggled(toggled_on: bool) -> void:
	OptionsManager.enable_screen_shake = toggled_on


func _on_start_button_pressed() -> void:
	OptionsManager.getSceneManager().load_level_scene_by_name("game")
