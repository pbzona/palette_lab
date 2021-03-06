extends Control

signal RAMP_SELECTED(ramp)
signal RAMP_DELETED(ramp)
signal RAMP_MODIFIED

const ColorCell = preload("res://src/palette/ColorCell.tscn")
const RampState = preload("res://src/palette/RampState.gd")
const RampShift = preload("res://src/palette/RampShift.gd")

const default_color = Color(0, 0, 0, 0)
const active_color = Color(.244, .244, .244, 1)
const default_ramp = [
	Color(0, 0, 0, 1),
	Color(1, 1, 1, 1)
]

var state = null
var shift = null
var app_state = null

func _init():
	state = RampState.new(self)
	shift = RampShift.new(self)
	
func _ready():
	_initialize_ramp()
	update_ui()

func set_state(data) -> void:
	app_state = data

func update_ui() -> void:
	$CountLabel.text = str($CountSlider.value)
	$CountSlider.value = state.get_count()
	_draw_ramp()
	emit_signal("RAMP_MODIFIED")
	if state.is_active():
		$Background.color = active_color
		$DeleteButton.visible = true
	else:
		$Background.color = default_color
		$DeleteButton.visible = false

func _initialize_ramp() -> void:
	state.set_colors(default_ramp)

func _clear_ramp() -> void:
	for color_cell in $CellContainer.get_children():
		color_cell.queue_free()

func _draw_ramp() -> void:
	_clear_ramp()
	state.update_colors()
	for c in state.get_colors():
		var new_color_cell = ColorCell.instance()
		new_color_cell.set_color(c)
		$CellContainer.add_child(new_color_cell)

func _on_SelectButton_pressed():
	emit_signal("RAMP_SELECTED", self)

func _on_DeleteButton_pressed():
	emit_signal("RAMP_DELETED", self)
	queue_free()

func _on_CountSlider_value_changed(value : float):
	state.set_count(int(value))
	update_ui()
