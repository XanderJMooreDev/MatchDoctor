pause_type = "Unpaused";
lost = false;
consecutive_losses = 0;
self.held_type = "Owl";
darkness = 0;

cm = obj_control_manager;

self.held_block = noone;

var held_block;
var held_type;
var held_stage;
var held_sprite;

create_managers = function() {
	instance_create_layer(0, 0, "Instances", obj_wave_manager);
	instance_create_layer(0, 0, "Instances", obj_control_manager);
	instance_create_layer(0, 0, "Instances", obj_score_manager);
	instance_create_layer(0, 0, "Instances", obj_debug_manager);
	instance_create_layer(0, 0, "Instances", obj_bird_menu_manager);
}

create_managers();

check_pause = function() {
	if !instance_exists(obj_control_manager) {
		return;
	}
	
	// If the game was paused by itself (for various reasons),
	// don't let the player unpause
	if pause_type != "Player" && pause_type != "Unpaused" {
		return;
	}
	
	if object_exists(obj_game_manager) && cm.controller.get_control_input_tap("pause") {
		if pause_type == "Unpaused" {
			pause_type = "Player";
			
			create_pause_buttons();
		}
		else {
			pause_type = "Unpaused";
			obj_bird_menu_manager.menu_open = false;
			
			with (obj_bird_menu_button) {
				instance_destroy();
			}
			
			with (obj_menu_close_button) {
				instance_destroy();
			}
			
			with (obj_tutorial_manager) {
				instance_destroy();
			}
		}
	}
}

create_pause_buttons = function() {
	instance_create_layer(-100, - 1000, "UI", obj_bird_menu_button);
	instance_create_layer(-100, - 1000, "UI", obj_tutorial_menu_button);
	instance_create_layer(-100, - 1000, "UI", obj_home_menu_button);
}

delete_pause_buttons = function() {
	instance_destroy(obj_bird_menu_button);
	instance_destroy(obj_tutorial_menu_button);
	instance_destroy(obj_home_menu_button);
}

select_bird = function(block) {
	
	if (block != noone) {
		held_block = block.object_index;
		held_type = block.type;
		held_stage = block.stage;
		held_sprite = block.sprite_index;
	}
	
	if (!lost) {
		if obj_wave_manager.check_if_major_area_end(obj_wave_manager.area + 1) {
			room = room_world_map;
		}
		else {
			obj_wave_manager.next_area();
		}
	}
	else {
		obj_wave_manager.repeat_area();
	}
	
	pause_type = "Unpaused";
}

check_for_death = function() {
	if (instance_number(obj_player) == 1) && ((instance_number(obj_temp_ally) == 0 && instance_number(drop_marker) == 0) || 
	(instance_number(obj_nest) == 0)) && pause_type == "Unpaused" {
		lost = true;
		pause_type = "End Screen";
		
		obj_score_manager.end_screen();
	}
}

fade_in = function() {
	if (darkness > 0) {
		darkness -= 2;
	}
}