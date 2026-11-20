if (!menu_open) {
	return;
}

current_bird = EnemyStats("ByID", bird_index);

draw_sprite_ext(spr_temp_path, 0, room_width / 2, room_height / 2,
10, 11, 0, c_white, 1);

if (birds_seen[bird_index]) {
	draw_sprite_ext(current_bird.sprite, 0, room_width * (3/8), room_height * (3/16),
	5, 5, 0, c_white, 1);
	
	gpu_set_tex_filter(true);
	draw_set_halign(fa_left);
	draw_set_colour(c_black);
	draw_text_ext_transformed(room_width * (15/32), room_height * (5/32), 
	string_concat(current_bird.name, ", Stage ", current_bird.stage), 0, 1000, 2.5, 2.5, 0);
	draw_text_ext_transformed(room_width * (5/16), room_height * (11/32),
	string_concat("Element: ", current_bird.rangeType), 0, 1000, 2, 2, 0);
	draw_text_ext_transformed(room_width * (5/16), room_height * (14/32),
	string_concat("HP: ", current_bird.maxHp), 0, 1000, 2, 2, 0);
	draw_text_ext_transformed(room_width * (5/16), room_height * (17/32),
	string_concat("Attack Cooldown: ", current_bird.maxCooldown), 0, 1000, 2, 2, 0);
	draw_text_ext_transformed(room_width * (5/16), room_height * (20/32),
	string_concat("Movement Speed: ", current_bird.moveSpeed), 0, 1000, 2, 2, 0);
	draw_text_ext_transformed(room_width * (5/16), room_height * (23/32),
	string_concat("Point Value: ", current_bird.scoreValue), 0, 1000, 2, 2, 0);
}
else {
	draw_sprite_ext(current_bird.sprite, 0, room_width * (3/8), room_height * (3/16),
	5, 5, 0, c_black, 1);
	
	gpu_set_tex_filter(true);
	draw_set_halign(fa_left);
	draw_set_colour(c_black);
	draw_text_ext_transformed(room_width * (15/32), room_height * (5/32), 
	"Undiscovered Bird", 20, 150, 2.5, 2.5, 0);
	draw_text_ext_transformed(room_width * (5/16), room_height * (11/32),
	"???", 0, 1000, 2, 2, 0);
}

draw_set_halign(fa_center);
draw_text_ext_transformed(room_width * (1/2), room_height * (28/32),
string_concat(bird_index + 1, " / ", EnemyStats("Count")), 0, 1000, 2, 2, 0);

gpu_set_tex_filter(false);

if (bird_index != 0) {
	draw_sprite_ext(spr_book_arrow, 0, room_width * (5/16), room_height * (29/32),
	-3, 3, 0, c_white, 1);
}

if (bird_index < EnemyStats("Count") - 1) {
	draw_sprite_ext(spr_book_arrow, 0, room_width * (11/16), room_height * (29/32),
	3, 3, 0, c_white, 1);
}