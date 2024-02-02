# Extends CharacterBody2D, providing a base for character movement and physics interactions
# in a 2D environment. This script handles basic character actions such as running, jumping,
# and animations based on movement and state changes.
extends CharacterBody2D

# Constants for movement speed and jump velocity to standardize and easily adjust the character's
# movement dynamics.
const SPEED = 400.0  # Horizontal movement speed.
const JUMP_VELOCITY = -900.0  # Vertical velocity applied when jumping.

# Automatically initializes a reference to the Sprite2D node when the character node is ready.
# This allows for controlling the character's visual representation, such as changing animations
# based on actions or movement direction.
@onready var sprite_2d = $Sprite2D

# Retrieves the gravity value from the project settings to ensure consistent physics behavior
# with other physics bodies in the scene. This allows the character's falling speed and jump
# dynamics to be in line with the global game settings.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called every physics frame (fixed framerate). It's used to process physics-related actions
# such as applying gravity, handling input for movement and jumping, and updating animations.
func _physics_process(delta):
	# Animations handling based on the character's horizontal velocity.
	# Changes the animation to "running" if moving horizontally, otherwise sets it to "default".
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Applies gravity when the character is not on the ground, simulating a falling motion.
	# Also changes the animation to "jumping" to reflect the character's state.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Jump handling. Checks if the jump action is triggered (e.g., a button press) and
	# the character is on the ground. If so, applies an upward velocity to simulate jumping.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement handling based on player input. Determines the direction of movement from input,
	# applies horizontal velocity accordingly, and flips the sprite based on the direction.
	var direction = Input.get_axis("left", "right")
	if direction:
		sprite_2d.flip_h = direction < 0  # Flips the sprite based on movement direction.
		velocity.x = direction * SPEED  # Applies horizontal velocity based on input direction.
	else:
		# Gradually reduces horizontal velocity to 0 when no input is detected, simulating friction.
		velocity.x = move_toward(velocity.x, 0, 30)

	# Applies the calculated velocity to the character, allowing for movement and collision handling.
	move_and_slide()
