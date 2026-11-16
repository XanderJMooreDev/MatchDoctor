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
}

// If the player is holding E, start the timer
if (keyboard_check(ord("E"))) {
    hold_timer += 1;

    if (hold_timer >= hold_duration) {
        // Your action goes here (e.g., charge attack, open menu)
        show_debug_message("Key held for 3 seconds!");
        
        // Reset timer so it doesn't trigger every single frame after 3 seconds
        hold_timer = 0; 
    }
} else {
    // Reset timer immediately if the player lets go early
    hold_timer = 0;
}

// If the player is holding Y, dance and stop movement 
if (keyboard_check(ord("Y"))) {
	dance_anims();
	walkSpeed = 0;
	runSpeed = 0;
} else {
	walkSpeed = 4;
	runSpeed = 5;
}