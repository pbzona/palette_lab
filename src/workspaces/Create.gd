extends Control

onready var palette = $Container/Palette
onready var color_tools = $Container/ColorTools
onready var shift_tools = $Container/ShiftTools

func _ready():
	_connect_all_signals()
	_update_toolbars()

func _connect_all_signals() -> void:
	color_tools.connect("CHANGED_LEFT_COLOR", self, "_on_left_color_changed")
	color_tools.connect("CHANGED_RIGHT_COLOR", self, "_on_right_color_changed")
	
	palette.connect("RAMP_CHANGED", self, "_update_toolbars")
	
	shift_tools.connect("SHIFT_CHANGED", self, "_on_shift_change")

func _on_left_color_changed(c : Color) -> void:
	if palette.active_ramp:
		palette.active_ramp.state.set_left_color(c)
		palette.active_ramp.update_ui()
	
func _on_right_color_changed(c : Color) -> void:
	if palette.active_ramp:
		palette.active_ramp.state.set_right_color(c)
		palette.active_ramp.update_ui()

func _update_pickers() -> void:
	var left = palette.active_ramp.state.get_left_color()
	var right = palette.active_ramp.state.get_right_color()
	color_tools.set_picker_colors(left, right)
	
func _update_shift() -> void:
	shift_tools.set_shift(palette.active_ramp.shift)

func _update_toolbars() -> void:
	_update_pickers()
	_update_shift()

func _on_shift_change() -> void:
	palette.active_ramp.update_ui()
