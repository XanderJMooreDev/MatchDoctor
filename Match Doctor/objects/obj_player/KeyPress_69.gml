var key_pickup = keyboard_check_pressed(ord("E"));

if (key_pickup) {
    // Get the last direction player faced before checking for block 
    var check_x = x;
    var check_y = y;

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

            // Get the object's type 
            held_block = block.object_index;
			
            // Remove the original thing that was there 
            with (block) {
                instance_destroy();
            }

            show_debug_message("Block picked up");
        } else {
            show_debug_message("No block found");
        }
    }
    // Dropping the block 
    else {
        // Make sure block placement is good 
        var drop_x = x;
        var drop_y = y;

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

        // If it is clear you can place 
        if (!place_meeting(drop_x, drop_y, obj_temp_solid_block)) {
            instance_create_layer(drop_x, drop_y, "Instances", held_block);

            is_Holding = false;
            held_block = noone;

            show_debug_message("Block placed");
        } else {
            show_debug_message("Cant put block here");
        }
    }
}