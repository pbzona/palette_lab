extends Object

# Returns true if an error occurs on save, otherwise returns false
func export_palette(palette, path) -> bool:
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
	
	var err = img.save_png(path) 
	if err:
		return true
	return false
