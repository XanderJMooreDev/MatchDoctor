// Sets & creates properties
velocityX = 0;
velocityY = 0;

walkSpeed = 4;
runSpeed = 5;

// Defines all objects you can't pass through
solids = [ obj_temp_solid_block ];

// Uses keyboard_check to set the directional controls. I'd like to
// eventually develop a obj_control_manager to allow for controller
// and keyboard support more easily
read_controls = function() {
	upControl = keyboard_check(ord("W"));
	downControl = keyboard_check(ord("S"));
	leftControl = keyboard_check(ord("A"));
	rightControl = keyboard_check(ord("D"));
	runControl = keyboard_check(ord("M"));
	
	// Sets the directional speed based on controls and base speed. If you
	// hold the run button, your speed is based on runSpeed. 
	inputX = (rightControl - leftControl);
	inputY = (downControl - upControl);
	
	if runControl {
		velocityX = runSpeed * inputX;
		velocityY = runSpeed * inputY;
	}
	else {
		velocityX = walkSpeed * inputX;
		velocityY = walkSpeed * inputY;
	}
}

move = function() {
	if velocityX != 0 {
		image_xscale = inputX * abs(image_xscale);
	}
	
	attempt_move(velocityX, velocityY);
}

attempt_move = function(moveX, moveY) {
	// For every solid object listed, the player will check if they
	// are meet those objects where they want to move. If they're not,
	// they will move there. Checks separately for x and y so you can't
	// get stuck on walls
	for (i = 0; i < array_length(solids); i++) {
		if !place_meeting(x + moveX, y, solids[i]) {
			x += moveX;
		}
		
		if !place_meeting(x, y + moveY, solids[i]) {
			y += moveY;
		}
	}
}