extends Node2D

@export var camera : Camera2D

func _physics_process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if camera:
		var camera_size = get_viewport_rect().size * camera.zoom
		var camera_rect = Rect2(camera.get_screen_center_position() - camera_size / 2, camera_size)
		global_position = Vector2(
			clampf(global_position.x, camera_rect.position.x, camera_rect.position.x + camera_rect.size.x),
			clampf(global_position.y, camera_rect.position.y, camera_rect.position.y + camera_rect.size.y)
		)
