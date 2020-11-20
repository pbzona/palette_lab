extends Control

signal RAMP_CHANGED

const Ramp = preload("res://src/palette/Ramp.tscn")

var active_ramp = null
var shift = null

onready var RampContainer = $ScrollBox/RampContainer

func _ready():
	var default_ramp = _create_new_ramp()
	_make_ramp_active(default_ramp)
	_add_ramp_to_ui(default_ramp)

func update_ui() -> void:
	pass

func get_all_ramps() -> Array:
	return RampContainer.get_children()

func _make_ramp_active(ramp):
	self.active_ramp = ramp
	if len(get_all_ramps()) > 0:
		for r in RampContainer.get_children():
			r.state.set_active(false)
	ramp.state.set_active(true)
	emit_signal("RAMP_CHANGED")

func _create_new_ramp() -> PackedScene:
	var ramp = Ramp.instance()
	ramp.connect("RAMP_DELETED", self, "delete_ramp")
	ramp.connect("RAMP_SELECTED", self, "_make_ramp_active")
	return ramp

func delete_ramp(ramp) -> void:
	pass

func _add_ramp_to_ui(ramp) -> void:
	$ScrollBox/RampContainer.add_child(ramp)
	update_ui()

func _on_AddRampButton_pressed():
	var ramp = _create_new_ramp()
	_add_ramp_to_ui(ramp)
	_make_ramp_active(ramp)
