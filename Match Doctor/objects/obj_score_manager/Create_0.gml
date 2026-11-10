level_high_scores = array_create(array_length(obj_wave_manager.rooms_by_area));
area_score = 0;
end_screen_transition = false;

end_screen_frame = 0;

ui_offset = (8 * (100 - end_screen_frame));

for (i = 0; i < array_length(level_high_scores); i++) {
	level_high_scores[i] = 0;
}

update_high_score = function() {
	level_high_scores[obj_wave_manager.area] = area_score;
}

end_screen = function() {
	update_high_score();
	end_screen_transition = true;
	
	instance_create_layer(-1000, y, "UI", obj_continue_button);
}

end_screen_update = function() {
	if (end_screen_transition && end_screen_frame < 99) {
		end_screen_frame++;
	}
}

star_count = function() {
	if area_score >=  4000 {
		return 3;
	}
	
	if area_score <= 0 {
		return 0;
	}
	
	return floor(area_score / 1000);
}