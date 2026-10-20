// For the function to work you need to include the block that was just placed and
// the blocks that will be later removed. 
function merge_objects(placed_block, merging_blocks){
	show_debug_message("Merge Started");
	// Creates an array to hold the blocks that needs to be merged, starting with
	// the original block to be merged 
	var blocks_to_merge = [];
	array_push(blocks_to_merge, merging_blocks);
	
	// Checks the number of blocks needed to merge that type of block, 
	// then sees if the amount of instances of that type are less then 
	// the needed amount.
	if ((placed_block.merge_amount <= (instance_number(placed_block)+1)) != true){
		return placed_block;
	}
	// Starts tracking the blocks to merge if there are more then 2 needed
	if (placed_block.merge_amount > 2){
		for (var i = 0; i < placed_block.merge_amount - 2; i += 1)
			{
				// Deactivates the current block in the array to avoid when using
				// instance_nearest, then finds the next nearest block
				instance_deactivate_object(blocks_to_merge[i]);
				var nearest_block = instance_nearest(merging_blocks.x, merging_blocks.y, 
									merging_blocks.object_index);
				// Starts to check if the blocks are close enough together to merge.
				// If they are, adds that block to the array and begins the loop again
				if (point_distance(blocks_to_merge[i].x, blocks_to_merge[i].y, 
					nearest_block.x, nearest_block.y) < 110){
					array_push(blocks_to_merge, nearest_block);
				// If not, reactivates all of the blocks and sends back the original
				} else {
					for (var j = 0; j < array_length(blocks_to_merge); j += 1)
					{
						instance_activate_object(blocks_to_merge[j]);
					}
					return placed_block;
				}
			}
		}
	// Looks at the instance to see if it can even be merged, like with the
	// pickup property
	if (variable_instance_exists(placed_block, "merger")){
		// Checks if all of the placed_blocks and the merging blocks have the 
		// same id, if so they send back the next step in the evolution.
		if (placed_block.object_index == merging_blocks.object_index){
			// Takes the value of the selected block and grabs what it will
			// become, which after it will turn that string into an instance. 
			var created_block = merging_blocks.will_become;
			created_block = asset_get_index(created_block);
			// Removes the blocks that need to be merged 
			for (var i = 0; i < array_length(blocks_to_merge); i += 1)
			{
				instance_destroy(blocks_to_merge[i]);
			}
			// Returns the correct block type
			return created_block;
		}
	}
	// If merge fails, recreates the original block
	return placed_block;
}