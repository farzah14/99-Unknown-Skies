extends Node2D

func _on_settings_pressed():
	print("Telah Di Press")
	if $ui/settings.visible == true:
		$ui/settings.visible = false
	else:
		$ui/settings.visible = true
	pass

func _on_exit_pressed():
	get_tree().quit()
