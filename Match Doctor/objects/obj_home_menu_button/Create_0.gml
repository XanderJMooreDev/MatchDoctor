go_to_ui_menu = function() {
	x = room_width * (3/8);
	y = room_height / 2;
}

allow_click = function() {
	if abs(mouse_x - x) < 70 &&
	abs(mouse_y - y) < 50 {
		image_xscale = 1.1;
		image_yscale = 1.1;
		
		if mouse_check_button_pressed(mb_left) {
			obj_game_manager.pause_type = "Unpaused";
			room = room_world_map;
		}
	}
	else {
		image_xscale = 1;
		image_yscale = 1;
	}
}