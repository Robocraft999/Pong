extends Area2D
class_name GoalCollider


func _on_area_entered(area: Area2D) -> void:
	if area.name == %ball.name:
		var ball: Ball = area
		var left := ball.direction.x < 0
		ball.out_of_bounds.emit(left)
