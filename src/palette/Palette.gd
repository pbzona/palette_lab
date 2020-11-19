extends Control

const Ramp = preload("res://src/palette/Ramp.tscn")
onready var RampContainer = $ScrollBox/RampContainer

var active_ramp = null

signal ACTIVE_RAMP_CHANGED

func _ready():
	var default_ramp = create_new_ramp()
	make_ramp_active(default_ramp)
	add_ramp_to_ui(default_ramp)

func update_ui() -> void:
	pass

func create_new_ramp() -> PackedScene:
	var ramp = Ramp.instance()
	ramp.connect("RAMP_DELETED", self, "delete_ramp")
	ramp.connect("RAMP_SELECTED", self, "make_ramp_active")
	return ramp

func delete_ramp(ramp) -> void:
	pass

func add_ramp_to_ui(ramp) -> void:
	$ScrollBox/RampContainer.add_child(ramp)
	update_ui()
	
func get_all_ramps() -> Array:
	return RampContainer.get_children()

func make_ramp_active(ramp):
	self.active_ramp = ramp
	if len(get_all_ramps()) > 0:
		for r in RampContainer.get_children():
			r.state.set_active(false)
	ramp.state.set_active(true)
	emit_signal("ACTIVE_RAMP_CHANGED")

func _on_AddRampButton_pressed():
	var ramp = create_new_ramp()
	add_ramp_to_ui(ramp)
	make_ramp_active(ramp)
