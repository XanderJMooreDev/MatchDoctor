bird_index = 0;
menu_open = false;

birds_seen = array_create(EnemyStats("Count"));

for (i = 0; i < array_length(birds_seen); i++) {
	birds_seen[i] = false;
}

check_controls_bird_menu = function() {
	pageLeftControl = keyboard_check_pressed(vk_left);
	pageRightControl = keyboard_check_pressed(vk_right);
}

check_navigate = function() {
	if (pageLeftControl && bird_index != 0) {
		bird_index--;
	}
	
	if (pageRightControl && bird_index < EnemyStats("Count") - 1) {
		bird_index++;
	}
}