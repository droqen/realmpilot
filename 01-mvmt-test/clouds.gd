extends Node2D

func _draw() -> void:
	for i in range(50):
		draw_set_transform(
			Vector2(
				randf_range(-200, 200),
				randf_range(-200, 200)
			),
			randf()*PI,
			Vector2.ONE * randf_range(.5, 1.0)
		)
		draw_rect(
			Rect2(-100,-100,200,200),
			Color(
				randf_range(0.25,0.75),
				randf_range(0.25,0.75),
				randf_range(0.25,0.75),
				0.25
			),
			true,
			-1.0,
			true
		)
	draw_set_transform_matrix(Transform2D.IDENTITY)
