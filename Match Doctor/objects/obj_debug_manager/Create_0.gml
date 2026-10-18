debug = false;

check_debug_controls = function() {
	speedUpControl = keyboard_check_pressed(vk_up);
	speedDownControl = keyboard_check_pressed(vk_down);
	speedResetControl = keyboard_check_pressed(vk_left) ||
	keyboard_check_pressed(vk_right);
	resetControl = keyboard_check_pressed(vk_backspace);
	volumeControl = keyboard_check_pressed(ord("1"));
}

check_reset = function() {
	if resetControl {
		room = room_startup;
		instance_destroy(obj_wave_manager);
		instance_create_layer(0, 0, "Characters", obj_wave_manager);
	}
}

check_audio = function() {
	if volumeControl {
		audio_stop_all();
	}
}

check_speedup = function() {
	// Temp setup for adjustable game speed
	if speedResetControl {
		game_set_speed(60, gamespeed_fps);
	}
	else if speedDownControl &&
	game_get_speed(gamespeed_fps) > 60 {
		game_set_speed(game_get_speed(gamespeed_fps) - 60, gamespeed_fps);
	}
	else if speedDownControl {
		game_set_speed(30, gamespeed_fps);
	}
	else if speedUpControl &&
	game_get_speed(gamespeed_fps) < 60 {
		game_set_speed(60, gamespeed_fps);
	}
	else if speedUpControl {
		game_set_speed(game_get_speed(gamespeed_fps) + 60, gamespeed_fps);
	}
	else {
		return;
	}
}

show_debug_message(game_get_speed(gamespeed_fps) / 60);