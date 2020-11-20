extends Control

signal CHANGED_LEFT_COLOR
signal CHANGED_RIGHT_COLOR

func set_picker_colors(left_color : Color, right_color : Color) -> void:
	$VBoxContainer/LeftColorContainer/LeftColorPicker.color = left_color
	$VBoxContainer/RightColorContainer/RightColorPicker.color = right_color

func _on_LeftColorPicker_color_changed(color):
	emit_signal("CHANGED_LEFT_COLOR", color)

func _on_RightColorPicker_color_changed(color):
	emit_signal("CHANGED_RIGHT_COLOR", color)
