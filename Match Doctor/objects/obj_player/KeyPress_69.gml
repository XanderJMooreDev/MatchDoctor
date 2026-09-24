var key_pickup = keyboard_check_pressed(ord("E"));

if (key_pickup) {
    // Get the last direction player faced before checking for block 
    var check_x = x;
    var check_y = y;
	// Check which way the player is facing so it can attempt to pick up the 
	// block in the right direction. 
    switch (facing) {
        case "up":
            check_y -= 16;
            break;
        case "down":
            check_y += 16;
            break;
        case "left":
            check_x -= 16;
            break;
        case "right":
            check_x += 16;
            break;
    }

    // Picking up the block 
    if (!is_Holding) {
        var block = instance_place(check_x, check_y, obj_temp_solid_block);

        if (block != noone) {
            is_Holding = true;
            // Get the object's type and store it 
            held_block = block.object_index;
            // Remove the original object that was there 
            with (block) {
                instance_destroy();
            }
		// Debugging messages 
            /* show_debug_message("Block picked up"); */ 
        } /*else {
            show_debug_message("No block found");
        }*/
    }
    // Dropping the block 
    else {
        var drop_x = x;
        var drop_y = y;
		// Finds which way the player is facing then makes the x or y 
		// be correct for placing the block. 
        switch (facing) {
            case "up":
                drop_y -= 64;
                break;
            case "down":
                drop_y += 64;
                break;
            case "left":
                drop_x -= 64;
                break;
            case "right":
                drop_x += 64;
                break;
        }
        // Checks if the placement of the block is alright for the object  
        if (!place_meeting(drop_x, drop_y, obj_temp_solid_block)) {
			// Checks if there are any other instances of the held block before attempting a merge 
			if (instance_exists(held_block)){
				// Checks where the nearest object is to the dropped object, if they are close enough
				// sends it to be merged. Must be done before object is placed.
				nearest_block = instance_nearest(drop_x, drop_y, held_block.object_index);
				show_debug_message(nearest_block);
				if (nearest_block != noone)
				{
					// Checks how the actual distance the dropped block is to the 
					// nearest block of the same type. 
					if (point_distance(drop_x, drop_y, nearest_block.x, nearest_block.y) < 96)
					{
						merge_objects(held_block.object_index, nearest_block.object_index);
					}
				}
			}
			
			// Creates the object that is stored at the correct layer 
            instance_create_layer(drop_x, drop_y, "Characters", held_block);
			// Setting original values back so they can be used again 
            is_Holding = false;
            held_block = noone;

            /*show_debug_message("Block placed"); */
        } /* else {
            show_debug_message("Cant put block here");
        } */
    }
}