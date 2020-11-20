extends VBoxContainer

func _ready():
	$Header.connect("SELECTED_CREATE", self, "_on_select_create")
	$Header.connect("SELECTED_EXPORT", self, "_on_select_export")

func _on_select_create() -> void:
	$Workspace.set_create_tab()

func _on_select_export() -> void:
	$Workspace.set_export_tab()
