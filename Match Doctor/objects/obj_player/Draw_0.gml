draw_self()

// draw collision mask if x pressed
if keyboard_check(ord("X")) {
	draw_set_colour(c_red)
	draw_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
}