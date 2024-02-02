# Extends the base Node class. This script is designed to manage game points,
# making it suitable for attaching to a game controller or a similar management node
# within your Godot project. It handles the scoring logic and updates the UI accordingly.
extends Node

# A variable to keep track of the points scored in the game. It is initialized to 0
# and is incremented by the add_point function. This variable can be accessed or modified
# by other scripts if necessary, providing a simple interface for score management.
var points = 0

# An @onready annotation is used to initialize a variable once the node and its children
# have entered the scene tree. The %PointsLabel placeholder should be replaced with
# the actual path to your PointsLabel node in the scene tree. This allows the script to
# directly manipulate the PointsLabel node (typically a Label node) to display the current score.
# The @onready keyword ensures the points_label variable is only initialized when the node
# is ready, preventing errors due to accessing nodes that have not been loaded yet.
@onready var points_label = %PointsLabel

# A function designed to increase the game's point total by 1 each time it is called.
# It then updates the points_label node's text to reflect the new score, ensuring the player
# can see their current points. This function can be called by various game events, such
# as collecting an item or defeating an enemy, to increment the score.
func add_point():
	points += 1  # Increments the points variable by 1.
	points_label.text = str("Points: ", points)  # Updates the points_label's text to show the updated score.
