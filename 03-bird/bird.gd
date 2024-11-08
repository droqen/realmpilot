extends RigidBody2D

@export var curs : Node2D
func _physics_process(delta: float) -> void:
	if linear_velocity.length_squared()>1:
		$birdanisprite.walking = true
	else:
		$birdanisprite.walking = false
	
	inertia = 9999
	angular_velocity = -rotation
	var to_cursor = curs.global_position - global_position
	if absf(to_cursor.x)>0.1:
		$birdanisprite.flip_h = to_cursor.x < 0
	
	linear_velocity = 5 * to_cursor.limit_length(100)
