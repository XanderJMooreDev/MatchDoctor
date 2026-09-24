// For the function to work you need to include the block that was just placed and
// the blocks that will be later removed. (Planning on coming back to fix it for array usage)
function merge_objects(placed_block, merging_blocks){
	show_debug_message(placed_block);
	show_debug_message(merging_blocks);
	instance_destroy(merging_blocks);
}