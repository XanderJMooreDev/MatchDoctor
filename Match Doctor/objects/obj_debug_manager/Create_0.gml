debug = false;

check_debug_controls = function() {
	speedUpControl = keyboard_check_pressed(vk_up);
	speedDownControl = keyboard_check_pressed(vk_down);
	speedResetControl = keyboard_check_pressed(vk_left) ||
	keyboard_check_pressed(vk_right);
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