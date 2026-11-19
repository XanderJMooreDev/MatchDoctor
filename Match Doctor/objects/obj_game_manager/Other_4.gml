if room == room_world_map {
	with (obj_select_level) {
		if area == obj_wave_manager.get_area(obj_wave_manager.area) {
			instance_create_layer(x, y + 80, "Player", obj_map_player);
		}
	}
	
	return;
}

if room != room_startup {
	darkness = 100;
	
	if (held_block != noone) {
		alarm[0] = 1;
	}
}