if obj_game_manager.game_paused {
	return;
}

if room == room_startup || room == room_world_map || room == room_tutorial {
	return;
}

spawn_wave();
check_wave_dead();