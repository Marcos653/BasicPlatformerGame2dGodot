# Extends the base Node class. This script is primarily used for handling
# level selection through UI interactions, such as button presses.
extends Node

# Function to handle the event when the "Level 1" button (or equivalent UI element)
# is pressed. This is intended to be connected to the pressed signal of a UI element
# through the Godot Editor or dynamically through code.
func _on_level_1_pressed():
	# Changes the current scene to "level1.tscn". This function is called when the
	# player selects Level 1 from the game's level selection screen or menu.
	# `change_scene_to_file` is a method of the SceneTree class, and it allows for
	# changing the current scene to a new one specified by its filesystem path.
	# Here, "res://scenes/level1.tscn" refers to the Level 1 scene stored in the
	# "scenes" directory of the project's resource path.
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

# Similar to `_on_level_1_pressed`, this function handles the event when the "Level 2"
# button is pressed. It's designed to be connected to the pressed signal of the Level 2
# selection UI element.
func _on_level_2_pressed():
	# Changes the current scene to "level2.tscn". This method facilitates immediate
	# transition to Level 2 upon the player's selection. It demonstrates how to manage
	# multiple levels within a game by simply changing the target scene file path.
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
