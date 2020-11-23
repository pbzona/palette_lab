extends Control

var export_path : String = ''
var palette = null

onready var FilePicker = $CenterContainer/Control/FileDialog
onready var ExportPath = $CenterContainer/Control/ExportPath

func _ready():
	ExportPath.text = export_path

func set_palette(p) -> void:
	self.palette = p

func _export_png(palette, path) -> void:
	var all_colors = palette.get_color_list()
	
	var height = 16
	var width = len(all_colors) * height
	
	var img = Image.new()
	img.create(width, height, false, Image.FORMAT_RGB8)
	img.lock()
	
	var color_idx = 0
	var loop_counter = 1
	
	for i in width:
		for j in height:
			img.set_pixel(i, j, all_colors[color_idx])
		if loop_counter >= 16:
			loop_counter = 0
			color_idx += 1
		loop_counter += 1
	img.unlock()
	img.save_png(path) 

func _on_BrowseButton_pressed():
	FilePicker.popup()

func _on_FileDialog_file_selected(path):
	self.export_path = path
	ExportPath.text = path

func _on_ExportButton_pressed():
	if self.palette and self.export_path:
		_export_png(self.palette, self.export_path)
