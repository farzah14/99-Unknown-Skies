extends Node2D

var splash : Node2D
var delay_timer: float = 4

func _ready():
	# Mengambil referensi node splash
	splash = $splash
# Fungsi untuk fadeout
func _process(delta):
	delay_timer -= delta
	if delay_timer <= 0:
		fade_out_splash()
			
func fade_out_splash():
	var splash_opacity = splash.modulate.a
	splash_opacity -= get_process_delta_time() * 3  # Decrease opacity by 0.5% per second

	# Fade out logo smoothly
	if splash_opacity <= 0.0:
		splash.modulate.a = 0.0  # Set opacity to 0 directly when it reaches 0
		fade_out_complete()
	else:
		splash.modulate.a = splash_opacity  # Apply the gradual decrease

func fade_out_complete():
	# Memanggil method untuk menghancurkan scene dan pindah ke scene mainmenu
	destroy_scene_and_load_main_menu()
	
func destroy_scene_and_load_main_menu():
	# Hancurkan scene
	get_tree().change_scene_to_file("res://phase/mainmenu/mainmenu.tscn")
