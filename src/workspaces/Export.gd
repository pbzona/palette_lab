extends Control

var export_path : String = ''

onready var FilePicker = $CenterContainer/Control/FileDialog
onready var ExportPath = $CenterContainer/Control/ExportPath

func _ready():
	ExportPath.text = export_path

func _create_png(palette) -> Image:
	# Replace with real functionality
	var img = Image.new()
	img.create(80, 300, false, Image.FORMAT_RGB8)
	return img

func _save_file(f) -> void:
	var file = File.new()
	file.open(f, File.WRITE)
	file.store_string("Hello")
	file.close()

func _on_BrowseButton_pressed():
	FilePicker.popup()

func _on_FileDialog_file_selected(path):
	self.export_path = path
	ExportPath.text = path

func _on_Button_pressed():
	_save_file(self.export_path)
