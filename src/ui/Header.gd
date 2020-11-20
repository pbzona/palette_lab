extends ColorRect

signal CREATE
signal EXPORT

func _on_CreateButton_pressed():
	emit_signal("CREATE")

func _on_ExportButton_pressed():
	emit_signal("EXPORT")
