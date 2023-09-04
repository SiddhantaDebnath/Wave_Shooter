extends Line2D
var length=40
var point=Vector2.ZERO
func _process(delta):
	self.global_position=Vector2.ZERO
	self.global_rotation=0
	point=get_parent().global_position
	add_point(point)
	while get_point_count()>length:
		remove_point(0)
