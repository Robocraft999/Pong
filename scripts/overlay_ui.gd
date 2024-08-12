extends Node2D


func _on_ball_out_of_bounds(left: bool) -> void:
	$Points._on_ball_out_of_bounds(left)
