# Extends Area2D to create an interactive game object, likely used for collectibles, triggers, or similar purposes.
extends Area2D

# A reference to the GameManager node. The '%' syntax is a placeholder and should be replaced
# with the actual path to your GameManager node within the scene tree.
# The @onready keyword ensures that the game_manager variable is initialized only after the node
# and its children have entered the scene tree, preventing errors due to uninitialized nodes.
@onready var game_manager = %GameManager

# Called when a body enters the Area2D's detection area. This method is connected to the
# Area2D's body_entered signal, which is emitted whenever a PhysicsBody enters its collision shape.
#
# Parameters:
#   body: The PhysicsBody instance that entered the Area2D. This could be another Area2D,
#         a character, enemy, or any other object with a PhysicsBody.
func _on_body_entered(body):
	# Immediately frees (destroys) this node upon collision with another body.
	# This is typically used for objects that should disappear upon interaction, like collectibles.
	queue_free()
	
	# Calls the add_point method on the game_manager. This method should be defined within
	# your GameManager script and is responsible for updating the game's state, such as increasing
	# the player's score or handling game progression logic.
	game_manager.add_point()
