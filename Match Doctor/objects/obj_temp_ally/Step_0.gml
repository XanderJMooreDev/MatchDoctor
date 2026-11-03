if obj_game_manager.game_paused {
	if abs(mouse_x - x) < 30 &&
	abs(mouse_y - y) < 30 &&
	obj_game_manager.selecting_bird {
		image_xscale = 2.5;
		image_yscale = 2.5;
	}
	else {
		image_xscale = 2;
		image_yscale = 2;
	}
	
	return;
}

// Called from scr_targeting
shoot_foe(targetable_objects);
status_tick();