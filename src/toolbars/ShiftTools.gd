extends Control

const Shift = preload("res://src/toolbars/Shift.gd")

var shift = null

signal SHIFT_OBJ_CREATED
signal SHIFT_CHANGE

func _ready():
	var s = Shift.new()
	self.shift = s
	emit_signal("SHIFT_OBJ_CREATED", s)

func _on_HueSlider_value_changed(value):
	self.shift.set_hue(value)
	emit_signal("SHIFT_CHANGE")

func _on_SaturationSlider_value_changed(value):
	self.shift.set_sat(value)
	emit_signal("SHIFT_CHANGE")

func _on_ValueSlider_value_changed(value):
	self.shift.set_val(value)
	emit_signal("SHIFT_CHANGE")

func _on_RedSlider_value_changed(value):
	self.shift.set_red(value)
	emit_signal("SHIFT_CHANGE")

func _on_GreenSlider_value_changed(value):
	self.shift.set_green(value)
	emit_signal("SHIFT_CHANGE")

func _on_BlueSlider_value_changed(value):
	self.shift.set_blue(value)
	emit_signal("SHIFT_CHANGE")
