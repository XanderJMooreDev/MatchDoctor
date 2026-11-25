if obj_game_manager.pause_type != "Unpaused" {
	return;
}

pathfind();

// Called from scr_targeting
shoot_foe(targetable_objects);
status_tick();