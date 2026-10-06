// For the function to work you need to include the block that was just placed and
// the blocks that will be later removed. (Planning on coming back to fix it for array usage)
function merge_objects(placed_block, merging_blocks){
	show_debug_message("Merge Started");
	// Looks at the instance to see if it can even be merged, like with the
	// pickup property
	if (variable_instance_exists(placed_block, "merger")){
		// Checks if all of the placed_blocks and the merging blocks have the 
		// same id, if so they send back the next step in the evolution. 
		if (placed_block.object_index == merging_blocks.object_index){
			var created_block = merging_blocks.will_become;
			created_block = asset_get_index(created_block);
			instance_destroy(merging_blocks);
			return created_block;
		}
	}
	return placed_block;
}