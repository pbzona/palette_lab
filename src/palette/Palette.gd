extends Control

signal RAMP_CHANGED
signal PALETTE_CHANGED

const Ramp = preload("res://src/palette/Ramp.tscn")

var active_ramp = null
var shift = null
var app_state = null

onready var RampContainer = $ScrollBox/RampContainer

func _ready():
	var default_ramp = _create_new_ramp()
	_make_ramp_active(default_ramp)
	_add_ramp_to_ui(default_ramp)

func set_state(data) -> void:
	app_state = data

func update_ui() -> void:
	pass

func get_all_ramps() -> Array:
	return RampContainer.get_children()

func get_color_count() -> int:
	return len(get_color_list())

func get_color_list() -> Array:
	var result = []
	var ramps = self.get_all_ramps()
	for r in ramps:
		for c in r.state.colors:
			result.append(c)
	return result 

func _make_ramp_active(ramp):
	self.active_ramp = ramp
	if len(get_all_ramps()) > 0:
		for r in RampContainer.get_children():
			r.state.set_active(false)
	ramp.state.set_active(true)
	emit_signal("RAMP_CHANGED")
	emit_signal("PALETTE_CHANGED", self)

func _create_new_ramp() -> PackedScene:
	var ramp = Ramp.instance()
	ramp.connect("RAMP_DELETED", self, "_notify_watchers")
	ramp.connect("RAMP_SELECTED", self, "_make_ramp_active")
	ramp.connect("RAMP_MODIFIED", self, "_notify_watchers")
	ramp.set_state(self.app_state)
	return ramp

func _notify_watchers() -> void:
	emit_signal("PALETTE_CHANGED", self)

func _add_ramp_to_ui(ramp) -> void:
	$ScrollBox/RampContainer.add_child(ramp)
	update_ui()

func _on_AddRampButton_pressed():
	var ramp = _create_new_ramp()
	_add_ramp_to_ui(ramp)
	_make_ramp_active(ramp)
