go_to_ui_menu = function() {
	x = room_width / 2;
	y = room_height / 2;
}

allow_click = function() {
	if abs(mouse_x - x) < 70 &&
	abs(mouse_y - y) < 50 {
		image_xscale = 1.1;
		image_yscale = 1.1;
		
		if mouse_check_button_pressed(mb_left) {
			// Open bird menu
			obj_bird_menu_manager.menu_open = true;
			instance_create_layer(x, y, "UI", obj_menu_close_button);
			obj_game_manager.delete_pause_buttons();
		}
	}
	else {
		image_xscale = 1;
		image_yscale = 1;
	}
}