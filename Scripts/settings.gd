# Settings Singleton: Autoloaded on start!
extends Node

var settings_file = "user://settings.save"

var master_volume = 0.8
var level_progress = 0
var found_cosi = 0

# temporary variables, not saved to disk!
var tmp_last_level = 0

func _ready():
	load_settings()
	print("SETTINGS: ready")

func save_settings():
	var f = File.new()
	f.open(settings_file, File.WRITE)
	f.store_var(master_volume)
	f.store_var(level_progress)
	f.store_var(found_cosi)
	f.close()
	print("SETTINGS: saved")

func load_settings():
	var f = File.new()	
	if f.file_exists(settings_file):
		f.open(settings_file, File.READ)
		master_volume = f.get_var()
		level_progress = f.get_var()
		found_cosi = f.get_var()
		f.close()
	print("SETTINGS: loaded")
