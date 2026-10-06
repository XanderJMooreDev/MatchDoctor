// For the function to work you need to include the block that was just placed and
// the blocks that will be later removed. (Planning on coming back to fix it for array usage)
function merge_objects(placed_block, merging_blocks){
	show_debug_message("Merge Started");
	// Looks at the instance to see if it can even be merged, like with the
	// pickup property
	if (variable_instance_exists(placed_block, "merger")){
		// Checks the number of blocks needed to merge that type of block, 
		// then sees if the amount of instances of that type are less then the needed amount. 
		if (placed_block.merge_amount <= (instance_number(placed_block)+1)){
			// Checks if all of the placed_blocks and the merging blocks have the 
			// same id, if so they send back the next step in the evolution.
			if (placed_block.object_index == merging_blocks.object_index){
				// Takes the value of the selected block and grabs what it will
				// become, which after it will turn that string into an instance. 
				var created_block = merging_blocks.will_become;
				created_block = asset_get_index(created_block);
				// Removes the unneeded block type 
				instance_destroy(merging_blocks);
				// Returns the correct block type
				return created_block;
			}
		}
	}
	// If merge fails, recreates the block part of the merge 
	return placed_block;
}