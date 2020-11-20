extends Control

enum tabs {CREATE = 0, ANALYZE = 1, REFINE = 2, EXPORT = 3}

var palette = null

func _ready():
	$Container/Create.connect("PALETTE_UPDATED", self, "set_workspace_palette")

func _set_create_tab() -> void:
	$Container.current_tab = tabs.CREATE

func _set_export_tab() -> void:
	$Container.current_tab = tabs.EXPORT

func _set_workspace_palette(p) -> void:
	self.palette = p
