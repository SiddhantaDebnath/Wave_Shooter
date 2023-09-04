extends Node2D
var speed=500
var damagevalue=10
func _physics_process(delta):
	position+=Vector2(speed*delta,0).rotated(rotation)
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
func _on_Area2D_body_entered(body):
	if "player" in body.name:
		body.damage(damagevalue)
		queue_free()
	pass # Replace with function body.
