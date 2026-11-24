draw_set_font(Font1);
draw_set_colour(c_white);
draw_set_halign(fa_right);

if (room == room_world_map || room == room_startup || room == room_tutorial) {
	return;
}

draw_text_ext_transformed(camera_get_view_width(camera_get_active()) - 4, 0, area_score, 0, 1000, 1.5, 1.5, 0);

ui_offset = (8 * (100 - end_screen_frame));

if !end_screen_transition {
	return;
}

draw_sprite_ext(spr_temp_block, 0, room_width / 2, room_height / 2, 100,
300, 0, c_black, end_screen_frame / 200);

draw_sprite_ext(spr_temp_path, 0, room_width / 2, room_height / 2 - ui_offset,
6, 8, 0, c_white, 1);

for (i = 0; i < 3; i++) {
	draw_sprite_ext(spr_ui_star, i < star_count(), room_width / 2 + (i - 1) * 100, 
	-200 + room_height / 2 - ui_offset, 2, 2, 0, c_white, 1);
}

draw_set_font(Font1);
draw_set_colour(c_green);
draw_set_halign(fa_center);

draw_text_ext_transformed(room_width / 2, -140 + room_height / 2 - ui_offset, area_score,
32, 340, 2, 2, 0);

draw_set_colour(c_black);

draw_text_ext_transformed(room_width / 2, -90 + room_height / 2 - ui_offset, review_message,
32, 340, 1, 1, 0);