// Sets & creates properties
velocityX = 0;
velocityY = 0;

walkSpeed = 4;
runSpeed = 5;

// Get tile layer ids
tile_path = layer_tilemap_get_id("tiles_path")
tile_cliff = layer_tilemap_get_id("tiles_cliff")
tile_cliff_bottom = layer_tilemap_get_id("tiles_cliff_bottom")

// Defines all objects you can't pass through
solids = [ obj_temp_ally, obj_temp_solid_block, tile_cliff ];

// Variables needed for general block moving
is_Holding = false;
held_Block = noone;
facing = "left";

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
	
	// This is to check which direction the player is facing at any given time
	// mostly to help with block placement. 
	if (inputX > 0) {
		facing = "right";
	} else if (inputX < 0) {
		facing = "left";
	} else if (inputY > 0) {
		facing = "down";
	} else if (inputY < 0) {
		facing = "up";
	}	
}

move = function() {
	if velocityX != 0 {
		//image_xscale = inputX * abs(image_xscale);
	}
	
	attempt_move(velocityX, velocityY);
}

attempt_move = function(moveX, moveY) {
	// For every solid object listed, the player will check if they
	// are meet those objects where they want to move. If they're not,
	// they will move there. Checks separately for x and y so you can't
	// get stuck on walls. wallX & wallY are true if you'll hit a wall
	wallX = false;
	wallY = false;
	
	for (i = 0; i < array_length(solids); i++) {
		if place_meeting(x + moveX, y, solids[i]) {
			wallX = true;
		}
		
		if place_meeting(x, y + moveY, solids[i]) {
			wallY = true;
		}
	}
	
	if !wallX {
		x += moveX;
	}
	
	if !wallY {
		y += moveY;
	}
}

check_tile_y = function(checkX, checkY, tile_layer, tile_index) {
	if(tile_get_index(tilemap_get_at_pixel(tile_layer, checkX, checkY)) == tile_index) { // exclude dirt path
		return true
	} else {
		return false
	}
}

switch_anims = function() {
	if(velocityX != 0) { // run left/right
		sprite_index = spr_player_run_side
		image_xscale = inputX * abs(image_xscale);
	} else if(velocityY < 0) { // run up
		sprite_index = spr_player_run_up
	} else if(velocityY > 0) { // run down
		sprite_index = spr_player_run_down
	} else { // idle
		sprite_index = spr_player_idle
	}
}