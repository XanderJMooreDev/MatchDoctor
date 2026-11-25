gpu_set_tex_filter(false);

held_block = noone;

// Sets & creates properties
velocityX = 0;
velocityY = 0;

marker_x = 0;
marker_y = 0;

held_type = "Owl";
held_stage = 0;

walkSpeed = 4;
runSpeed = 5;

cm = obj_control_manager;

// Get tile layer ids
tile_path = layer_tilemap_get_id("tiles_path")
tile_cliff = layer_tilemap_get_id("tiles_cliff")
tile_cliff_bottom = layer_tilemap_get_id("tiles_cliff_bottom")

// Defines all objects you can't pass through
solids = [ obj_temp_ally, obj_temp_solid_block, tile_cliff,
obj_nest, obj_tree1, obj_tree2 ];

// Variables needed for general block moving
is_Holding = false;
held_Block = noone;
facing = "left";
nearest_block = noone;

// Uses keyboard_check to set the directional controls. I'd like to
// eventually develop a obj_control_manager to allow for controller
// and keyboard support more easily
read_controls = function() {
	
	// Sets the directional speed based on controls and base speed. If you
	// hold the run button, your speed is based on runSpeed. 
	inputX = cm.controller.get_joystick_x();
	inputY = cm.controller.get_joystick_y();
	
	if cm.controller.get_control_input_hold("run") {
		velocityX = runSpeed * inputX;
		velocityY = runSpeed * inputY;
	}
	else {
		velocityX = walkSpeed * inputX;
		velocityY = walkSpeed * inputY;
	}
	
	if cm.controller.placement_mode == "Auto" || held_block == noone || (cm.controller.placement_mode == "Selective" && (inputX != 0 || inputY != 0)) {
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
	else if cm.controller.placement_mode == "Twinstick" || cm.controller.placement_mode == "Selective" {
		aimInputX = cm.controller.get_joystick_sx();
		aimInputY = cm.controller.get_joystick_sy();
		
		// If using twinstick mode, you can aim independent of movement
		if (aimInputX > 0) {
			facing = "right";
		} else if (aimInputX < 0) {
			facing = "left";
		} else if (aimInputY > 0) {
			facing = "down";
		} else if (aimInputY < 0) {
			facing = "up";
		}
	}
	else if cm.controller.placement_mode == "Mouse" {
		if abs(mouse_x - x) > abs(mouse_y - y) {
			aimInputX = (mouse_x - x) / abs(mouse_x - x);
			aimInputY = 0;
		}
		else {
			aimInputX = 0;
			aimInputY = (mouse_y - y) / abs(mouse_y - y);
		}
		
		// You can also aim using the mouse position relative to the player
		if (aimInputX > 0) {
			facing = "right";
		} else if (aimInputX < 0) {
			facing = "left";
		} else if (aimInputY > 0) {
			facing = "down";
		} else if (aimInputY < 0) {
			facing = "up";
		}
	}
}

move = function() {
	if velocityX != 0 {
		//image_xscale = inputX * abs(image_xscale);
	}
	
	attempt_move(velocityX, velocityY);
}

// Modified code from the enemy object to check if this is a valid placement
check_block = function(cx, cy, obj) {
	spacer = 24;
	
	if position_meeting(cx + spacer, cy + spacer, obj) ||
	position_meeting(cx - spacer, cy - spacer, obj) ||
	position_meeting(cx - spacer, cy + spacer, obj) ||
	position_meeting(cx + spacer, cy - spacer, obj) {
		return true;
	}
	
	return false;
}


space_free = function(placeX, placeY) {
	if (placeX > room_width) || (placeX < 0) {
		return false;
	}
	
	if (placeY > room_height) || (placeY < 0) {
		return false;
	}
	
	for (i = 0; i < array_length(solids); i++) {
		if check_block(placeX, placeY, solids[i]) {
			return false;
		}
	}
	
	if check_block(placeX, placeY, tile_path) {
		return false;
	}
	
	return true;
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
	
	if (x + moveX > room_width) || (x + moveX < 0) {
		wallX = true;
	}
	
	if (y + moveY > room_height) || (y + moveY < 0) {
		wallY = true;
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

dance_anims = function() {
	sprite_index = spr_player_dance
}

// Info Menu Variables
info_Layer = layer_get_id("InfoLayer");
infoVis = false;
layer_set_visible(info_Layer, false)

// Variables for the timer, used for holding E
e_hold_timer = 0;
hold_duration = 50;
should_merge = false;

e_was_pressed = false;