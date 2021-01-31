extends Node2D
class_name stagesBase

enum VICTORYCONDITIONS {KILLALL, CASHGRAB, BOSS}
export(VICTORYCONDITIONS) var victoryCondtion : int = 0
export var victoryJumpTime : int = 5

var victoryJumpTimer = Timer.new()

func _ready():
	victoryJumpTimer.connect("timeout",self,"victory")
	victoryJumpTimer.set_wait_time(victoryJumpTime)
	add_child(victoryJumpTimer)

func _physics_process(delta):
	checkVictoryCondition()

func checkVictoryCondition():
	match victoryCondtion:
		VICTORYCONDITIONS.KILLALL:
			if countEnemies() == 0 and victoryJumpTimer.is_stopped():
				victoryJumpTimer.start()
		_:
			pass

func victory():
	get_tree().change_scene("res://gui/levelComplete.tscn")

func countEnemies() -> int:
	return get_tree().get_nodes_in_group("enemies").size();
