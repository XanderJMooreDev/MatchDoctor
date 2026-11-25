if obj_game_manager.game_paused {
	return;
}

read_controls();
move();
switch_anims();
// This is for marker stuff
if (is_Holding && instance_exists(drop_marker_id)) {
    marker_x = x;
    marker_y = y;
	// Checks direction of player, gets coords 
    switch (facing) {
        case "up":
            marker_y -= 96;
            break;

        case "down":
            marker_y += 96;
            break;

        case "left":
            marker_x -= 96;
            break;

        case "right":
            marker_x += 96;
            break;
    }
	
	marker_x = round((marker_x - 32) / 32) * 32 + 32;
	marker_y = round((marker_y) / 32) * 32;
	
	// Moves it accordingly 
	drop_marker_id.x = marker_x;
    drop_marker_id.y = marker_y;
	
	if space_free(marker_x, marker_y) {
		drop_marker_id.image_blend = c_white;
	}
	else {
		drop_marker_id.image_blend = c_red;
	}
}

// Check if E is held
var key_held = cm.controller.get_control_input_hold("pickup");

// Increase the timer while E is held
if (key_held) {
    e_hold_timer++;
}

// Detect when e is released
if (!key_held && e_was_pressed) {

    // Determine if it is a hold or a tap
    should_merge = (e_hold_timer >= hold_duration);
    // Trigger the E function
    scr_press_e();

    // Resetting the timer
    e_hold_timer = 0;
}

// Remember the previous key state
e_was_pressed = key_held;

// This checks for merge dancing and if the player wants to do the Y dance 
if ((key_held && e_hold_timer > 8 && is_Holding) || cm.controller.get_control_input_hold("dance")) {
	dance_anims();
	walkSpeed = 0;
	runSpeed = 0;
} else {
	walkSpeed = 4;
	runSpeed = 5;
}