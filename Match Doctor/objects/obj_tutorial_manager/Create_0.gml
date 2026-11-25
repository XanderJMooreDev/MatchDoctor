current_screen = 0;
current_frame = 0;

cm = obj_control_manager;

anims = [ clip1, clip2, clip3, clip4, clip5 ];
texts = [
	"Use WASD to walk freely around the map. You can walk over paths and won't be attacked by enemies.",
	"Press E to pick up or place ally troops, as well as fallen enemy birds to recruit them.",
	"Your allies (and enemy birds) will attack automatically when their opponents enter their radius.",
	"Line up three birds to merge them. When placing the third bird, hold E for a moment to perform the merge dance, and release to merge.",
	"Press Enter to pause, and select the Bird Book to see the stats of encountered birds."
];

scroll_tutorial = function() {
	if cm.controller.any_joystick("left") && current_screen > 0 {
		current_screen--;
		current_frame = 0;
	}
	
	if cm.controller.any_joystick("right") && current_screen < array_length(anims) - 1 {
		current_screen++;
		current_frame = 0;
	}
	
	if cm.controller.get_control_input_tap("pickup") {
		if room == room_tutorial {
			room = room_world_map;
		}
		else {
			obj_game_manager.create_pause_buttons();
			
			instance_destroy();
		}
	}
}

step_anim = function() {
	current_frame += sprite_get_speed(anims[current_screen]) / game_get_speed(gamespeed_fps);
}