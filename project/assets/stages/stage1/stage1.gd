extends Node2D

onready var bg2 = get_node("background")
var plEnemy := preload("res://assets/enemies/wimpy.tscn")
var parallaxSpeed = 10.0
onready var newEnemy := $enemyTimer
var allEnemiesSpawned = false

func _ready():
	for i in range(20):
		var enemies = plEnemy.instance()
		enemies.set_position(Vector2(rand_range(0,900),-50))
		yield(get_tree().create_timer(0.5), "timeout")
		add_child(enemies)
	allEnemiesSpawned = true

func _physics_process(delta):
	pass
	

func isLevelComplete():
	
	var enemiesLeft = get_tree().get_nodes_in_group("Enemies").empty()
	var lootLeft = get_tree().get_nodes_in_group("Loot").size() - 1
	if allEnemiesSpawned and enemiesLeft and lootLeft == 0:
		get_parent().levelCompleted()
		
