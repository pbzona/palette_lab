extends ColorRect

signal SELECTED_CREATE
signal SELECTED_EXPORT

func _on_CreateButton_pressed():
	emit_signal("SELECTED_CREATE")

func _on_ExportButton_pressed():
	emit_signal("SELECTED_EXPORT")
