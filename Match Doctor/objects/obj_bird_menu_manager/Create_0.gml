bird_index = 0;
menu_open = false;

cm = obj_control_manager;

birds_seen = array_create(EnemyStats("Count"));

for (i = 0; i < array_length(birds_seen); i++) {
	birds_seen[i] = false;
}

check_controls_bird_menu = function() {
	pageLeftControl = keyboard_check_pressed(vk_left);
	pageRightControl = keyboard_check_pressed(vk_right);
}

check_navigate = function() {
	if (cm.controller.any_joystick("left") && bird_index != 0) {
		bird_index--;
	}
	
	if (cm.controller.any_joystick("right") && bird_index < EnemyStats("Count") - 1) {
		bird_index++;
	}
}