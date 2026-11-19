draw_self();

// When hovered, display a tooltip
if (image_xscale == 1.1) {
	draw_set_colour(c_green);
	draw_set_halign(fa_center);
	draw_text_ext(room_width / 2, room_height / 2 - 25, "Need some extra help? Click here to get an extra buff bird!",
	32, 300);
}