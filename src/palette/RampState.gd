extends Node

var active : bool = false
var count : int = 3
var colors : Array = []

var Ramp = null

func _init(ref):
	self.Ramp = ref

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

func calculate_linear_ramp(start = get_left_color(), end = get_right_color()) -> Array:
	var result = [start]
	var levels = get_count() - 2
	for i in levels:
		var factor = float(i + 1) / float(get_count() - 1)
		var new_color = start.linear_interpolate(end, factor)
		result.append(new_color)
	result.append(end)
	return result

func get_left_color() -> Color:
	return self.colors[0]

func set_left_color(c : Color) -> void:
	var new_colors = calculate_linear_ramp(c, get_right_color())
	set_colors(new_colors)

func get_right_color() -> Color:
	return self.colors[len(self.colors) - 1]
	
func set_right_color(c : Color) -> void:
	var new_colors = calculate_linear_ramp(get_left_color(), c)
	set_colors(new_colors)
