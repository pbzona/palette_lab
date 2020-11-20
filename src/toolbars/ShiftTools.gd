extends Control

signal SHIFT_CHANGED

var shift = null

func update_ui() -> void:
	$ControlContainer/HueControl/HueSlider.value = self.shift.get_hue()
	$ControlContainer/SaturationControl/SaturationSlider.value = self.shift.get_sat()
	$ControlContainer/ValueControl/ValueSlider.value = self.shift.get_val()
	$ControlContainer/RedControl/RedSlider.value = self.shift.get_red()
	$ControlContainer/GreenControl/GreenSlider.value = self.shift.get_green()
	$ControlContainer/BlueControl/BlueSlider.value = self.shift.get_blue()

func set_shift(s) -> void:
	self.shift = s
	update_ui()

func _on_HueSlider_value_changed(value):
	self.shift.set_hue(value)
	emit_signal("SHIFT_CHANGED")

func _on_SaturationSlider_value_changed(value):
	self.shift.set_sat(value)
	emit_signal("SHIFT_CHANGED")

func _on_ValueSlider_value_changed(value):
	self.shift.set_val(value)
	emit_signal("SHIFT_CHANGED")

func _on_RedSlider_value_changed(value):
	self.shift.set_red(value)
	emit_signal("SHIFT_CHANGED")

func _on_GreenSlider_value_changed(value):
	self.shift.set_green(value)
	emit_signal("SHIFT_CHANGED")

func _on_BlueSlider_value_changed(value):
	self.shift.set_blue(value)
	emit_signal("SHIFT_CHANGED")

func _on_ResetButton_pressed():
	self.shift.reset_all()
	emit_signal("SHIFT_CHANGED")
	update_ui()
