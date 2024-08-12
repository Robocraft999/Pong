extends Area2D
class_name BoundaryCollider

func _on_area_entered(area: Area2D) -> void:
	if area.name == %ball.name:
		var ball: Ball = area
		ball.direction.y *= -1
		ball.shake(false)
