# Extends Area2D to utilize Godot's 2D physics engine for detection and interaction.
# This script is typically attached to a node that acts as a trigger area in your game,
# such as a level exit or a teleportation point.
extends Area2D

# An exported variable allows you to set the target level from the Godot editor.
# The type `PackedScene` is used for storing scenes that can be instantiated at runtime.
# By exporting this variable, you can easily assign the next level's scene directly from the editor,
# making this node versatile for level transitions.
@export var target_level: PackedScene

# This function is called when a body (another physics-enabled object, like the player or an NPC)
# enters the Area2D's collision shape. The function is automatically connected to the Area2D's
# `body_entered` signal, which is a built-in signal emitted by Area2D nodes in Godot.
#
# Parameters:
#   body: The PhysicsBody2D (e.g., a character or an object) that entered the trigger area.
#         This parameter is automatically passed by the signal and can be used if you need
#         to check properties of the entering body.
func _on_body_entered(body):
	# Changes the current scene to a new scene specified by `target_level`.
	# `change_scene_to_packed` is a method provided by SceneTree for changing the current scene.
	# It takes a PackedScene as an argument, which is why `target_level` is of type PackedScene.
	# This allows for a dynamic and flexible level transition system where the next level
	# can be easily set in the Godot editor without modifying the script.
	get_tree().change_scene_to_packed(target_level)
