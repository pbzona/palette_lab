extends Node

var active : bool = false
var count : int = 3
var colors : Array = []

var left_base : Color
var right_base : Color 

var Ramp = null

func _init(ref):
	self.Ramp = ref
	self.left_base = ref.default_ramp[0]
	self.right_base = ref.default_ramp[1]

func set_shift(s) -> void:
	self.shift = s

func is_active() -> bool:
	return self.active

func set_active(val : bool) -> void:
	self.active = val
	Ramp.update_ui()

func get_count() -> int:
	return self.count

func set_count(new_count : int) -> void:
	self.count = new_count

func get_colors() -> Array:
	return self.colors

func set_colors(new_colors : Array) -> void:
	if len(new_colors) > 0:
		self.colors = new_colors

func update_colors() -> void:
	if len(self.colors) > 0:
		var new_colors = calculate_linear_ramp()
		set_colors(new_colors)

func calculate_linear_ramp(start = get_left_base(), end = get_right_base()) -> Array:
	var result = [apply_shift(start)]
	var levels = get_count() - 2
	for i in levels:
		var factor = float(i + 1) / float(get_count() - 1)
		var new_color = start.linear_interpolate(end, factor)
		result.append(apply_shift(new_color))
	result.append(apply_shift(end))
	return result

func get_left_color() -> Color:
	return self.colors[0]

func set_left_color(c : Color) -> void:
	set_left_base(c)
	var new_colors = calculate_linear_ramp(c, get_right_base())
	set_colors(new_colors)

func get_right_color() -> Color:
	return self.colors[len(self.colors) - 1]
	
func set_right_color(c : Color) -> void:
	set_right_base(c)
	var new_colors = calculate_linear_ramp(get_left_base(), c)
	set_colors(new_colors)
	
func get_left_base() -> Color:
	return self.left_base

func set_left_base(c : Color) -> void:
	self.left_base = c

func get_right_base() -> Color:
	return self.right_base

func set_right_base(c : Color) -> void:
	self.right_base = c

func apply_shift(c : Color) -> Color:
	if Ramp.shift:
		c.h += Ramp.shift.get_hue()
		c.s += Ramp.shift.get_sat()
		c.v += Ramp.shift.get_val()
		c.r += Ramp.shift.get_red()
		c.g += Ramp.shift.get_green()
		c.b += Ramp.shift.get_blue()
	return c
	
