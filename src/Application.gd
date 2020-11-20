extends VBoxContainer

func _ready():
	$Header.connect("CREATE", self, "set_create_mode")
	$Header.connect("EXPORT", self, "set_export_mode")

func set_create_mode() -> void:
	print('create - app')
	$Workspace.set_create_tab()

func set_export_mode() -> void:
	print('export - app')
	$Workspace.set_export_tab()
