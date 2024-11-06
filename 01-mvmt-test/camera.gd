extends Camera2D

var v : Vector2
@export var target : Node2D
func _physics_process(delta: float) -> void:
	if target:
		v = lerp(v * 0.98, 10.0 * (target.position*0.1 - position), 0.1 * delta)
	position += v * delta
