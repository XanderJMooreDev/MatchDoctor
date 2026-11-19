draw_self();

// When hovered, display a tooltip
if (image_xscale == 1.1) {
	draw_set_colour(c_red);
	draw_set_halign(fa_center);
	draw_text_ext(room_width / 2, room_height / 2 - 25, "WARNING: You will have to start from the beginning of this area.",
	32, 300);
}