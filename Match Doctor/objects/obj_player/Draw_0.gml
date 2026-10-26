draw_self()

// draw collision mask if x pressed
if keyboard_check(ord("X")) {
	draw_set_colour(c_red)
	draw_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
}

if held_block != noone {
	draw_sprite_ext(held_sprite, 0, x, y - 64, 1, 1, 0, c_white,
	.75);
}