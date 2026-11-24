current_screen = 0;
current_frame = 0;

anims = [ clip1, clip2, clip3, clip4, clip5 ];
texts = [
	"Use WASD to walk freely around the map. You can walk over paths and won't be attacked by enemies.",
	"Press E to pick up or place ally troops, as well as fallen enemy birds to recruit them.",
	"Your allies (and enemy birds) will attack automatically when their opponents enter their radius.",
	"Line up three birds to merge them. When placing the third bird, hold E for a moment to perform the merge dance, and release to merge.",
	"Press Enter to pause, and select the Bird Book to see the stats of encountered birds."
];

check_controls = function() {
	tutorialLeftControl = keyboard_check_pressed(vk_left);
	tutorialRightControl = keyboard_check_pressed(vk_right);
	tutorialSkipControl = keyboard_check_pressed(vk_space);
}

scroll_tutorial = function() {
	if tutorialLeftControl && current_screen > 0 {
		current_screen--;
		current_frame = 0;
	}
	
	if tutorialRightControl && current_screen < array_length(anims) - 1 {
		current_screen++;
		current_frame = 0;
	}
	
	if tutorialSkipControl {
		room = room_world_map;
	}
}

step_anim = function() {
	current_frame += sprite_get_speed(anims[current_screen]) / game_get_speed(gamespeed_fps);
}