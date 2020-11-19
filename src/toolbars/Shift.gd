extends Node

var hue = 0
var sat = 0
var val = 0
var red = 0
var green = 0
var blue = 0

func get_hue() -> float:
	return self.hue

func set_hue(h : float) -> void:
	self.hue = h

func get_sat() -> float:
	return self.sat

func set_sat(s : float) -> void:
	self.sat = s

func get_val() -> float:
	return self.val

func set_val(v : float) -> void:
	self.val = v

func get_red() -> float:
	return self.red

func set_red(r : float) -> void:
	self.red = r

func get_green() -> float:
	return self.green

func set_green(g : float) -> void:
	self.green = g

func get_blue() -> float:
	return self.blue

func set_blue(b : float) -> void:
	self.blue = b



