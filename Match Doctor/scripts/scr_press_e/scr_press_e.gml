function scr_press_e(){
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
        // Calls for the parent of the pickups to see if it is one of them 
        var block = instance_place(check_x, check_y, Pickup_Parent);
		// Checks if the instance has the "pickup" variable property 
		if (variable_instance_exists(block, "pickup")){
			// Checks if the block is even there (Also used for debugging purposes)
	        if (block != noone) {
	            is_Holding = true;
	            // Get the object's type and store it 
				held_element = "Unneeded";
	            held_block = block.object_index;
				held_type = block.type;
				held_stage = block.stage;
				held_sprite = block.sprite_index;
				
				if held_type == "Hartman" {
					held_element = block.rangeType;
				}
				
				if (!instance_exists(drop_marker)) {
				    drop_marker_id = instance_create_layer(x, y, "Characters", drop_marker, {
						sprite_index: held_sprite,
						image_alpha: .75,
						image_xscale: 2,
						image_yscale: 2
					});
				}
				
				if variable_instance_exists(block, "hp") {
					held_hp = block.hp;
				}
	            // Remove the original object that was there 
	            with (block) {
	                instance_destroy();
	            }
	        } 
	    }
	}
    // Dropping the block 
    else {
        var drop_x = x;
        var drop_y = y;
		
		drop_x = marker_x;
		drop_y = marker_y;
		
		if (!space_free(drop_x, drop_y)) {
			return;
		}
        // Checks if the placement of the block is alright for the object  
        if (!place_meeting(drop_x, drop_y, Pickup_Parent)) {
			// Checks if there are any other instances of the held block before attempting a merge 
			if (should_merge && instance_exists(held_block)){
				// Checks where the nearest object is to the dropped object, if they are close enough
				// sends it to be merged. Must be done before object is placed.
				nearest_block = instance_nearest(drop_x, drop_y, held_block.object_index);
				if (nearest_block != noone)
				{
					// Checks how the actual distance the dropped block is to the 
					// nearest block of the same type. 
					if (point_distance(drop_x, drop_y, nearest_block.x, nearest_block.y) < 96)
					{
						temp_block = held_block;
						if (held_type == "Hartman") {
							hartman_merge(held_block, nearest_block);
						} else {
							held_block = merge_objects(held_block, nearest_block);
						}
						if (temp_block != held_block) {
							held_stage++;
							
							obj_score_manager.area_score += 1000 * held_stage;
						}
					}
				}
			}
			
			// Creates the object that is stored at the correct layer 
			if (held_block != noone){
				inst = instance_create_layer(drop_x, drop_y, "Characters", held_block,
				{
					type: held_type,
					stage: held_stage,
					sprite_index: held_sprite,
					rangeType: held_element
				});
				
				// After creating an enemy object, we try to place it alive
				// as a troop. This is temporary until we add reviving
				if inst.object_index == obj_fallen_enemy {
					inst.place();
				}
				else {
					inst.hp = held_hp;
				}
			}
			// Destroying drop_marker when unneeded
			if (instance_exists(drop_marker)) {
				instance_destroy(drop_marker);
			}
			// Setting original values back so they can be used again 
            is_Holding = false;
            held_block = noone;
        }
    }
}