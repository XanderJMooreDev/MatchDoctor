if !debug {
	return;
}

draw_set_colour(c_red);

draw_text_ext_transformed(0, 0, 
string_concat(game_get_speed(gamespeed_fps) / 60, "x Speed"),
0, 1000, 1.5, 1.5, 0);