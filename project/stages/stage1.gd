extends stagesBase

onready var plGui = preload("res://gui/stageHUD.tscn")
onready var plShip = preload("res://player/sb0.tscn")
onready var plWhimpy = preload("res://enemies/wimpy.tscn")

var allEnemiesSpawned := false

func _ready():
	var enemy = plWhimpy.instance()
	var playerOnePosition: Vector2
	var gui = plGui.instance()
	var player1 = plShip.instance()
	player1.position = get_player_position()
	add_child(gui)
	add_child(player1)
	add_child(enemy)

func get_player_position(numOfPlayers: int = 1) -> Vector2:
	var playerPos = get_viewport_rect().size
	playerPos.x = (playerPos.x - 200) / 2
	playerPos.y = playerPos.y - 50
	return playerPos

func isLevelComplete():
	
	if allEnemiesSpawned:
		get_tree().change_scene("res://gui/levelComplete.tscn")
