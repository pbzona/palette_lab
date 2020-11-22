extends Control

enum tabs {CREATE = 0, ANALYZE = 1, REFINE = 2, EXPORT = 3}

var palette = null

func _ready():
	$Container/Create.connect("PALETTE_UPDATED", self, "_set_workspace_palette")
	_set_export_palette(self.palette)

func set_create_tab() -> void:
	$Container.current_tab = tabs.CREATE

func set_export_tab() -> void:
	$Container.current_tab = tabs.EXPORT

func _set_workspace_palette(p) -> void:
	_set_export_palette(p)
	self.palette = p

func _set_export_palette(p) -> void:
	$Container/Export.set_palette(p)
