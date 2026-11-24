if room == room_world_map || room == room_tutorial || room == room_startup {
	return;
}

check_pause();
fade_in();
check_for_death();