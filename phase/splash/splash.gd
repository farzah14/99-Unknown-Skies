extends Node2D

var black_colorrect: ColorRect = null
var white_colorrect: ColorRect = null
var wiqireative: Node2D = null
var delay_timer: float = 0.4
var initial_scale: Vector2 = Vector2(0.6, 0.6)
var target_scale: Vector2 = Vector2(1.0, 1.0)

func _ready():
	black_colorrect = $black
	white_colorrect = $white
	wiqireative = $wiqireative
	preparation()

func preparation():
	wiqireative.modulate.a = 0.0
	wiqireative.scale = initial_scale  # Set initial scale

func _process(delta):
	var black_opacity = black_colorrect.modulate.a
	black_opacity -= delta * 0.8

	# Fade out black_colorrect smoothly
	if black_opacity <= 0:
		black_colorrect.modulate.a = 0 # Set opacity to 0 directly when it reaches 0
		delay_timer -= delta
		if delay_timer <= 0:
			fade_in_logo()
	else:
		black_colorrect.modulate.a = black_opacity # Apply the gradual decrease

func fade_in_logo():
	var wiqireative_opacity = wiqireative.modulate.a
	wiqireative_opacity += get_process_delta_time() * 4 # Increase opacity by 0.5% per second

	# Fade in logo smoothly
	if wiqireative_opacity >= 1.0:
		wiqireative.modulate.a = 1.0 # Set opacity to 1 directly when it reaches 1
		wiqireative.scale = target_scale
	else:
		wiqireative.modulate.a = wiqireative_opacity # Apply the gradual increase
		var interpolated_scale = linear_interpolate(initial_scale, target_scale, wiqireative_opacity)
		wiqireative.scale = interpolated_scale
		
func linear_interpolate(a: Vector2, b: Vector2, t: float) -> Vector2:
	return (1.0 - t) * a + t * b
