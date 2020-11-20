extends Control

enum tabs {CREATE = 0, ANALYZE = 1, REFINE = 2, EXPORT = 3}

func set_create_tab() -> void:
	print(tabs.CREATE)
	$Container.current_tab = tabs.CREATE

func set_export_tab() -> void:
	print(tabs.EXPORT)
	$Container.current_tab = tabs.EXPORT
