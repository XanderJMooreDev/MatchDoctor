go_to_ui_menu = function() {
	x = room_width * (22/32);
	y = room_height * (3/32);
}

allow_click = function() {
	if abs(mouse_x - x - 30) < 30 &&
	abs(mouse_y - y) < 30 {
		image_xscale = 1.1;
		image_yscale = 1.1;
		
		if mouse_check_button_pressed(mb_left) {
			obj_bird_menu_manager.menu_open = false;
			obj_game_manager.create_pause_buttons();
			instance_destroy();
		}
	}
	else {
		image_xscale = 1;
		image_yscale = 1;
	}
}