extends KinematicBody2D
var speed=300
var velocity=Vector2.ZERO
var direction=Vector2.ZERO
var distance=0
var target
var health=100
var canshoot=true
onready var label=get_node("Label")
onready var timer=get_node("Timer")
onready var muzzle=get_node("gunContainer/Position2D")
onready var guncontainer=get_node("gunContainer")
onready var gunsprite=get_node("gunContainer/gun")
onready var bullet=preload("res://bulletenemy.tscn")
func _ready():
	target=find_parent("main").get_node("player")
func _physics_process(delta):
	label.text=str(health)
	distance=self.global_position.distance_to(target.global_position)
	direction=target.global_position-self.global_position
	guncontainer.rotation=direction.angle()
	if direction.x>0:
		gunsprite.flip_v=false
	else:
		gunsprite.flip_v=true
	direction=direction.normalized()
	velocity=lerp(velocity,direction*speed,delta*25)
	if distance>200:
		velocity=lerp(velocity,direction*speed,delta*25)
	elif distance<150:
		velocity=lerp(velocity,-direction*speed,delta*30)
	else:
		velocity=Vector2.ZERO
	move_and_slide(velocity)
	if canshoot==true:
		var bulletInstance=bullet.instance()
		bulletInstance.position=muzzle.global_position
		bulletInstance.rotation=guncontainer.rotation
		get_parent().add_child(bulletInstance)
		timer.start()
		canshoot=false
func damage(value):
	health=health-value
	if health>value:
		velocity=-velocity*6
	else :
		queue_free()


func _on_Timer_timeout():
	canshoot=true
