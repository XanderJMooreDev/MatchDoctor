draw_self();

// When hovered, display a tooltip
if (image_xscale == 1.1) {
	draw_set_colour(c_black);
	draw_set_halign(fa_center);
	draw_text_ext(room_width * (3/8), room_height / 2 - 75, "Return To Map",
	32, 300);
	draw_set_colour(make_colour_rgb(255, 78, 78));
	draw_text_ext(room_width * (3/8), room_height / 2 - 100, "You will have to start over",
	32, 300);
	draw_set_colour(c_white);
	draw_text_ext(room_width * (3/8) - 4, room_height / 2 - 79, "Return To Map",
	32, 300);
}