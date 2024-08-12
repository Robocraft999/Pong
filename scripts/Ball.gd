extends Area2D

var speed = 300.

var direction: Vector2 = Vector2.RIGHT + Vector2.UP #if randf() < 0.5 else Vector2.RIGHT
@onready var extents_y: float = $Sprite2D.get_rect().size.y / 2. * $Sprite2D.global_scale.y
@onready var screen_y = get_viewport_rect().size.y

func _physics_process(delta: float) -> void:
	speed += speed * 0.005 * delta
	translate(direction * speed * delta)
	
	# ceiling
	if position.y <= extents_y or is_equal_approx(extents_y, position.y) \
		or position.y >= (screen_y - extents_y) or is_equal_approx(position.y, screen_y - extents_y):
		direction.y *= -1
		pass
	pass
