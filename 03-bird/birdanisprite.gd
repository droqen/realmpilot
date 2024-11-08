extends Sprite2D

var ani : int = 0
var subani : int = 0
var walking : bool = true
func _physics_process(_delta: float) -> void:
	if walking or ani > 0:
		subani += 1
		if subani>6:ani=(ani+1)%4;subani=0;
		frame = 20+ani
