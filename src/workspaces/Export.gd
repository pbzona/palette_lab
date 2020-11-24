extends Control

const ExportPNG = preload("res://src/export/ExportPNG.gd")

var export_path : String = ''
var palette = null
var app_state = null

onready var FilePicker = $CenterContainer/Control/FileDialog
onready var ExportPath = $CenterContainer/Control/ExportPath

func _ready():
	ExportPath.text = export_path

func set_state(data) -> void:
	app_state = data

func set_palette(p) -> void:
	self.palette = p

func _on_BrowseButton_pressed():
	FilePicker.popup()

func _on_FileDialog_file_selected(path):
	self.export_path = path
	ExportPath.text = path

func _on_ExportButton_pressed():
	if self.palette and self.export_path:
		var exporter = ExportPNG.new()
		var res = exporter.export_palette(self.palette, self.export_path)
		if res:
			$ErrorConfirmation.popup()
		else:
			$SaveConfirmation.popup()
