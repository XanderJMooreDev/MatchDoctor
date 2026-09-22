var key_pickup = keyboard_check_pressed(ord("E"));

if (key_pickup) {
	var block = instance_place(x+16, y+16, obj_temp_solid_block);
	show_debug_message(direction);
	
	if (block != noone && is_Holding != true) {
		is_Holding = true;
		show_debug_message("Block Found");
	} else {
		show_debug_message("none or holding");
	}
}