// For the function to work you need to include the block that was just placed and
// the blocks that will be later removed. (Planning on coming back to fix it for array usage)
function merge_objects(placed_block, merging_blocks){
	// Checks if all of the placed_blocks and the merging blocks have the 
	// same id, if so they send back the next step in the evolution. 
	if (placed_block.id == merging_blocks.id){
		instance_destroy(merging_blocks);
		return obj_temp_ally;
	}
	return placed_block;
}