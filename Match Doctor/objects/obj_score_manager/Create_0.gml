level_high_scores = array_create(array_length(obj_wave_manager.rooms_by_area));
area_score = 0;
end_screen_transition = false;
review_message = "";

end_screen_frame = 0;

ui_offset = (8 * (100 - end_screen_frame));

for (i = 0; i < array_length(level_high_scores); i++) {
	level_high_scores[i] = 0;
}

update_high_score = function() {
	if (area_score > level_high_scores[obj_wave_manager.area]) {
		level_high_scores[obj_wave_manager.area] = area_score;
	}
}

end_screen = function() {
	update_high_score();
	end_screen_transition = true;
	
	if obj_game_manager.lost {
		obj_game_manager.consecutive_losses++;
	}
	else {
		obj_game_manager.consecutive_losses = 0;
	}
	
	review_message = generate_message(star_count());
	
	instance_create_layer(-1000, y, "UI", obj_continue_button);
	instance_create_layer(-1000, y, "UI", obj_home_button);
	
	if (obj_game_manager.consecutive_losses >= 1) {
		instance_create_layer(-1200, y, "UI", obj_rescue_button);
	}
}

end_screen_update = function() {
	if (end_screen_transition && end_screen_frame < 99) {
		end_screen_frame++;
	}
}

star_count = function() {
	if obj_game_manager.lost {
		return 0;
	}
	
	if area_score >=  4000 {
		return 3;
	}
	
	if area_score <= 0 {
		return 0;
	}
	
	return floor(area_score / 1000);
}



get_major_area_score = function(area_num) {
	temp = 0;
	place = 0;
	
	for (i = 0; i <= area_num; i++) {
		for (j = 0; j < obj_wave_manager.major_area_lengths[i]; j++) {
			if (i == area_num) {
				temp += level_high_scores[place];
			}
			
			place++;
		}
	}
	
	return temp;
}