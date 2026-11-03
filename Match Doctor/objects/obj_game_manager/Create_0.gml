game_paused = false;
player_paused = false;
selecting_bird = false;

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
		obj_game_manager.game_paused = !obj_game_manager.game_paused;
	}
}

select_bird = function(block) {
	held_block = block.object_index;
	held_type = block.type;
	held_stage = block.stage;
	held_sprite = block.sprite_index;
	
	game_paused = false;
	obj_wave_manager.next_area();
	alarm[0] = 1;
}