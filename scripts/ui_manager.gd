extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%CameraShakeButton.button_pressed = OptionsManager.enable_screen_shake
	%CameraShakeButton.text = "Camera Shake: On" if OptionsManager.enable_screen_shake else "Camera Shake: Off"

func _on_camera_shake_button_toggled(toggled_on: bool) -> void:
	OptionsManager.enable_screen_shake = toggled_on
	%CameraShakeButton.text = "Camera Shake: On" if toggled_on else "Camera Shake: Off"


func _on_start_button_pressed() -> void:
	OptionsManager.getSceneManager().load_level_scene_by_name("game")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
