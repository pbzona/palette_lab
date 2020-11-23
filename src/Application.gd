extends VBoxContainer

const AppState = preload("res://src/config/AppState.gd")

var app_state = null

func _ready():
	app_state = AppState.new()
	$Header.set_state(app_state)
	$Workspace.set_state(app_state)
	$Header.connect("SELECTED_CREATE", self, "_on_select_create")
	$Header.connect("SELECTED_EXPORT", self, "_on_select_export")

func _on_select_create() -> void:
	$Workspace.set_create_tab()

func _on_select_export() -> void:
	$Workspace.set_export_tab()
