extends Control

const Shift = preload("res://src/toolbars/Shift.gd")

var shift = null

signal SHIFT_OBJ_CREATED

func _ready():
	self.shift = Shift.new()
	emit_signal("SHIFT_OBJ_CREATED", self.shift)

func _on_HueSlider_value_changed(value):
	self.shift.set_hue(value)

func _on_SaturationSlider_value_changed(value):
	self.shift.set_sat(value)

func _on_ValueSlider_value_changed(value):
	self.shift.set_val(value)

func _on_RedSlider_value_changed(value):
	self.shift.set_red(value)

func _on_GreenSlider_value_changed(value):
	self.shift.set_green(value)

func _on_BlueSlider_value_changed(value):
	self.shift.set_blue(value)
