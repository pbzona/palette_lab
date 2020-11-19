extends Control

onready var palette = $Container/Palette
onready var color_tools = $Container/ColorTools

func _ready():
	connect_all_signals()

func connect_all_signals() -> void:
	color_tools.connect("CHANGE_LEFT_COLOR", self, "on_left_color_changed")
	color_tools.connect("CHANGE_RIGHT_COLOR", self, "on_right_color_changed")
	
	palette.connect("ACTIVE_RAMP_CHANGED", self, "update_pickers")

func on_left_color_changed(c : Color) -> void:
	if palette.active_ramp:
		palette.active_ramp.state.set_left_color(c)
		palette.active_ramp.update_ui()
	
func on_right_color_changed(c : Color) -> void:
	if palette.active_ramp:
		palette.active_ramp.state.set_right_color(c)
		palette.active_ramp.update_ui()

func update_pickers() -> void:
	var left = palette.active_ramp.state.get_left_color()
	var right = palette.active_ramp.state.get_right_color()
	color_tools.set_picker_colors(left, right)
