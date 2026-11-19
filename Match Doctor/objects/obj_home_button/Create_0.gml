go_to_ui_menu = function() {
	x = room_width / 2 + 70;
	y = -200 + room_height - obj_score_manager.ui_offset;
}

allow_click = function() {
	
	if abs(mouse_x - x) < 50 &&
	abs(mouse_y - y) < 50 {
		image_xscale = 1.1;
		image_yscale = 1.1;
		
		if mouse_check_button_pressed(mb_left) {
			room = room_world_map;
			
			obj_score_manager.end_screen_transition = false;
			obj_score_manager.end_screen_frame = 0;
			
			instance_destroy();
		}
	}
	else {
		image_xscale = 1;
		image_yscale = 1;
	}
}