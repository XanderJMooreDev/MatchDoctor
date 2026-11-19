if (abs(x - obj_map_player.x) < 130 && abs(y - obj_map_player.y) < 100) {
	if (transparency < 100) {
		transparency += 5;
	}
}
else if (transparency > 0) {
	transparency -= 5;
}

draw_sprite_ext(spr_ui_button, 0, x, y - 100, 5, 5, 0, c_white, transparency / 100);
draw_set_halign(fa_center);
draw_set_colour(c_black);
draw_set_alpha(transparency / 100);
draw_text_ext(x, y - 135, obj_wave_manager.major_area_names[area], 0, 1000);
draw_text_ext(x, y - 115, string_concat("High Score: ", obj_score_manager.get_major_area_score(area)), 0, 1000);

if area == 0 || (obj_score_manager.get_major_area_score(area - 1) > 0) {
	draw_text_ext(x, y - 95, "Press Space to Enter", 0, 1000);
}
else {
	draw_text_ext(x, y - 95, string_concat("Complete ", obj_wave_manager.major_area_names[area - 1]), 0, 1000);
}

draw_sprite_ext(spr_temp_block, 0, room_width / 2, room_height / 2, 200, 100, 0, c_black, darkness / 100);

draw_set_alpha(1);