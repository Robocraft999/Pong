extends Node2D


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		OptionsManager.getSceneManager().load_level_scene_by_name("OptionsMenu")

func _on_ball_out_of_bounds(left: bool) -> void:
	$Points._on_ball_out_of_bounds(left)
