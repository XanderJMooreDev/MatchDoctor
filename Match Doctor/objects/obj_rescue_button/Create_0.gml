go_to_ui_menu = function() {
	x = room_width / 2;
	y = -300 + room_height - obj_score_manager.ui_offset;
}

select_sprite = function() {
	image_index = obj_game_manager.lost;
}

allow_click = function() {
	
	if abs(mouse_x - x) < 60 &&
	abs(mouse_y - y) < 60 {
		image_xscale = 1.1;
		image_yscale = 1.1;
		
		if mouse_check_button_pressed(mb_left) {
			with (obj_game_manager) {
				held_block = obj_temp_ally;
				held_type = "Hartman";
				held_stage = 0;
				held_sprite = spr_hartman_green;
			}
			
			instance_destroy();
		}
	}
	else {
		image_xscale = 1;
		image_yscale = 1;
	}
}