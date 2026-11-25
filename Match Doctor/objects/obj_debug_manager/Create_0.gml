debug = false;

check_debug_controls = function() {
	speedUpControl = keyboard_check_pressed(ord("I"));
	speedDownControl = keyboard_check_pressed(ord("K"));
	speedResetControl = keyboard_check_pressed(ord("J")) ||
	keyboard_check_pressed(ord("L"));
	resetControl = keyboard_check_pressed(vk_backspace);
	volumeControl = keyboard_check_pressed(ord("O"));
	hartmanControl = keyboard_check_pressed(ord("P"));
	autoPlacementControl = keyboard_check_pressed(ord("1"));
	twinstickPlacementControl = keyboard_check_pressed(ord("2"));
	selectivePlacementControl = keyboard_check_pressed(ord("3"));
	mousePlacementControl = keyboard_check_pressed(ord("4"));
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
		
		audio_master_gain(0);
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

check_make_hartman_bird = function() {
	if hartmanControl && instance_exists(obj_player) {
		instance_create_layer(obj_player.x + 64, obj_player.y, "Characters", obj_temp_ally,
		{
			type: "Hartman",
			stage: 0,
			image_xscale: 2,
			image_yscale: 2,
			merge_amount: 2
		});
	}
}

check_placement_method = function() {
	if autoPlacementControl {
		obj_control_manager.controller.placement_mode = "Auto";
	}
	
	if twinstickPlacementControl {
		obj_control_manager.controller.placement_mode = "Twinstick";
	}
	
	if selectivePlacementControl {
		obj_control_manager.controller.placement_mode = "Selective";
	}
	
	if mousePlacementControl {
		obj_control_manager.controller.placement_mode = "Mouse";
	}
}

show_debug_message(game_get_speed(gamespeed_fps) / 60);