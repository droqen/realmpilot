extends Node2D

var v : Vector2
var desired_spd_amp : float
var desired_spd : float

func _physics_process(delta: float) -> void:
	var c = get_global_mouse_position()
	var toc = c - position
	var toc_dir = toc.normalized()
	var toc_dist = toc.length()
	desired_spd_amp = 0.0
	if toc_dist < 13: desired_spd_amp = 0.0
	elif toc_dist < 50: desired_spd_amp = remap(toc_dist,13,50,0.00,0.33)
	elif toc_dist < 200: desired_spd_amp = remap(toc_dist,50,200,0.33,1.00)
	else: desired_spd_amp = 1.00
	desired_spd = desired_spd_amp * 300.0
	var desired_v = toc_dir * desired_spd
	v = lerp(v, desired_v, 5.0 * delta)
	position += v * delta
	queue_redraw()

func _draw() -> void:
	var t : Transform2D
	var cur_spd_amp : float = v.length() / 300.0
	t = t.scaled(Vector2(
		lerp(1.0, 1.44, cur_spd_amp*cur_spd_amp),
		lerp(1.0, 0.75, cur_spd_amp*cur_spd_amp)
	))
	t = t.rotated(v.angle())
	draw_set_transform_matrix(t)
	draw_circle(Vector2.ZERO, 4.0, Color.AQUA, true, -1.0, true)
	#draw_rect(Rect2(-5,-5,10,10),Color.AQUA)
	draw_set_transform_matrix(Transform2D.IDENTITY)
