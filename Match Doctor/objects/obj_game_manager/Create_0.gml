game_paused = false;
player_paused = false;
selecting_bird = false;
lost = false;
consecutive_losses = 0;
self.held_type = "Owl";

var held_block;
var held_type;
var held_stage;
var held_sprite;

check_pause = function() {
	// If the game was paused by itself (for various reasons),
	// don't let the player unpause
	if player_paused == false && game_paused == true {
		return;
	}
	
	pauseControl = keyboard_check_pressed(vk_enter);
	
	if object_exists(obj_game_manager) && pauseControl {
		game_paused = !game_paused;
		player_paused = !player_paused;
	}
}

select_bird = function(block) {
	
	if (block != noone) {
		held_block = block.object_index;
		held_type = block.type;
		held_stage = block.stage;
		held_sprite = block.sprite_index;
	}
	
	if (!lost) {
		selecting_bird = false;
		obj_wave_manager.next_area();
	}
	else {
		obj_wave_manager.repeat_area();
	}
	
	game_paused = false;
	
	if (block != noone) {
		alarm[0] = 1;
	}
}

check_for_death = function() {
	if (instance_number(obj_player) == 1) && ((instance_number(obj_temp_ally) == 0 && instance_number(drop_marker) == 0) || 
	(instance_number(obj_nest) == 0)) && !game_paused {
		lost = true;
		game_paused = true;
		
		obj_score_manager.end_screen();
	}
}