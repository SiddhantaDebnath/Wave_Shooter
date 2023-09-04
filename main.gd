extends Node2D
onready var enemy=preload("res://enemy.tscn")
onready var target=get_node("player")
func _ready():
	randomize()
func _on_Timer_timeout():
	var enemyinstance=enemy.instance()
	enemyinstance.position=getpos()
	add_child(enemyinstance)
func getpos():
	return Vector2(rand_range(target.position.x-1000,target.position.x+1000),rand_range(target.position.y-1000,target.position.y+1000))
	
	
	
