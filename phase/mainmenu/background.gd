extends Node2D

var _min_size = Vector2.ZERO

func _ready():
	var screenSize = get_viewport_rect().size
	_min_size = screenSize
	$bg.set_size(screenSize)

func _process(_delta):
	var screenSize = get_viewport_rect().size
	$bg.set_size(clamp(screenSize, _min_size, screenSize))

func _on_opensett_pressed():
	get_tree().quit()
