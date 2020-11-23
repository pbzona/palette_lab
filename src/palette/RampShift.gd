extends Node

var hue = 0 setget set_hue, get_hue
var sat = 0 setget set_sat, get_sat
var val = 0 setget set_val, get_val
var red = 0 setget set_red, get_red
var green = 0 setget set_green, get_green
var blue = 0 setget set_blue, get_blue

var Ramp = null

func _init(ref) -> void:
	self.Ramp = ref

func get_hue() -> float:
	return hue

func set_hue(h : float) -> void:
	hue = h

func get_sat() -> float:
	return sat

func set_sat(s : float) -> void:
	sat = s

func get_val() -> float:
	return val

func set_val(v : float) -> void:
	val = v

func get_red() -> float:
	return red

func set_red(r : float) -> void:
	red = r

func get_green() -> float:
	return green

func set_green(g : float) -> void:
	green = g

func get_blue() -> float:
	return blue

func set_blue(b : float) -> void:
	blue = b

func reset_all() -> void:
	self.hue = 0
	self.sat = 0
	self.val = 0
	self.red = 0
	self.green = 0
	self.blue = 0

