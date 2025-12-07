extends Node

# A global state singleton for storing flags and variables shared across scenes.
var variables: Dictionary = {}
var flags: Dictionary = {}

func set_flag(flag_name: String, value: bool = true) -> void:
	# Set the boolean value for a named flag. Flags are used for one-off events.
	flags[flag_name] = value

func get_flag(flag_name: String) -> bool:
	# Return the value of the named flag, or false if it's unset.
	return flags.get(flag_name, false)

func set_var(var_name: String, value) -> void:
	# Store an arbitrary value under the given variable name.
	variables[var_name] = value

func get_var(var_name: String, default = null):
	# Retrieve the value associated with the given variable name, or the default.
	return variables.get(var_name, default)
