if obj_game_manager.game_paused {
	return;
}

pathfind();

// Called from scr_targeting
shoot_foe(targetable_objects);
status_tick();