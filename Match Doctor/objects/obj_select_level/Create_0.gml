transparency = 0;
darkness = 0;

allow_player_entrance = function() {
	if (area == 0 || (obj_score_manager.level_high_scores[area - 1] > 0))
	&& (abs(x - obj_map_player.x) < 130 && abs(y - obj_map_player.y) < 100) && keyboard_check_pressed(vk_space) {
		darkness += 2;
	}
}

switch_to_level = function() {
	if (darkness >= 100) {
		obj_wave_manager.start_area(area);
	}
	else if (darkness > 0) {
		darkness += 2;
	}
}