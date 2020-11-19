extends ColorRect

func _init(color : Color = Color(randf(), randf(), randf())) -> void:
	set_color(color)

func set_color(color : Color) -> void:
	self.color = color
