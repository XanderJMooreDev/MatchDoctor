draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);

frame_scale = 1;

draw_text_ext_transformed(room_width * (1/4), room_height / 2, texts[current_screen], 32, 400,
1.5, 1.5, 0);

if current_screen = 4 {
	frame_scale = 1.5;
	
	draw_text_ext_transformed(room_width / 2, room_height * (7/8), "Press E to continue", 32, 200,
	1.5, 1.5, 0);
}
else {
	draw_text_ext_transformed(room_width / 2, room_height * (7/8), "Navigate with Arrow Keys, Press E to skip", 32, 200,
	1.5, 1.5, 0);
}

draw_set_valign(fa_top);

draw_sprite_ext(anims[current_screen], current_frame, room_width * (3/4), room_height / 2,
frame_scale, frame_scale, 0, c_white, 1);