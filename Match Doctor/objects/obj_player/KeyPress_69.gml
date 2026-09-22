var key_pickup = keyboard_check_pressed(ord("E"));

if (key_pickup) {
    // Pick up the block
    if (!is_Holding) {
        var block = instance_place(x + 16, y + 16, obj_temp_solid_block);

        if (block != noone) {
            is_Holding = true;

            // Keeps track of what the player is holding
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
        is_Holding = false;

        // Remake the block at the original position 
        instance_create_layer(x + 64, y, "Instances", held_block);
        held_block = noone;

        show_debug_message("Block placed");
    }
}