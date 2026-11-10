if game_paused {
	if player_paused {
		draw_sprite_ext(spr_pause_ui, 0, room_width - 80, 
		40, 1, 1, 0, c_white, 1);
	}
	else if selecting_bird {
		draw_set_halign(fa_center);
		draw_set_colour(c_white);
		draw_text_ext_transformed(room_width / 2, 64, 
		"Select a bird to bring to the next area", 0, 1000,
		2, 2, 0);
	}
}