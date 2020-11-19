extends Control

signal CHANGE_LEFT_COLOR
signal CHANGE_RIGHT_COLOR

func _ready():
	pass

func set_picker_colors(left_color : Color, right_color : Color) -> void:
	$VBoxContainer/LeftColorContainer/LeftColorPicker.color = left_color
	$VBoxContainer/RightColorContainer/RightColorPicker.color = right_color

func _on_LeftColorPicker_color_changed(color):
	emit_signal("CHANGE_LEFT_COLOR", color)

func _on_RightColorPicker_color_changed(color):
	emit_signal("CHANGE_RIGHT_COLOR", color)
