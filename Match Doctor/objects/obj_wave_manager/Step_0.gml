if obj_game_manager.pause_type != "Unpaused" {
	return;
}

if room == room_startup || room == room_world_map || room == room_tutorial {
	return;
}

spawn_wave();
check_wave_dead();