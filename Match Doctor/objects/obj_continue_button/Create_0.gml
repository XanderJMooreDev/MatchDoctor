go_to_ui_menu = function() {
	x = room_width / 2 + 70;
	y = -200 + room_height - obj_score_manager.ui_offset;
}

select_sprite = function() {
	image_index = obj_game_manager.lost;
}

allow_click = function() {
	
	if abs(mouse_x - x) < 50 &&
	abs(mouse_y - y) < 50 {
		image_xscale = 1.1;
		image_yscale = 1.1;
		
		if mouse_check_button_pressed(mb_left) {
			obj_score_manager.end_screen_transition = false;
			obj_score_manager.end_screen_frame = 0;
			obj_score_manager.area_score = 0;
			
			if (!obj_game_manager.lost) {
				obj_game_manager.pause_type = "Selecting Bird";
			}
			else {
				obj_game_manager.select_bird(noone);
			}
			
			instance_destroy();
		}
	}
	else {
		image_xscale = 1;
		image_yscale = 1;
	}
}