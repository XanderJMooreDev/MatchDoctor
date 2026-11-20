draw_self();

// When hovered, display a tooltip
if (image_xscale == 1.1) {
	draw_set_colour(c_black);
	draw_set_halign(fa_center);
	draw_text_ext(room_width / 2, room_height / 2 - 75, "Bird Book",
	32, 300);
	draw_set_colour(c_white);
	draw_text_ext(room_width / 2 - 4, room_height / 2 - 79, "Bird Book",
	32, 300);
}