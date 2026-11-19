area = 0;
wave = 0;

fireworks = 0;
rainbow = [ c_red, c_orange, c_yellow, c_lime,
c_blue, c_purple ];

global.living_enemies = 0;

n = 0;

spawn_cooldown = 300;
max_spawn_cooldown = 30;

rooms_by_area = [ room_woods_1, room_woods_2, room_woods_3, room_ice_1, room_ice_2, room_ice_3, room_startup ];

major_area_lengths = [ 3, 3, 1 ];
major_area_names = [ "Robin Woods", "Icicle Tundra", "Placeholder" ];

woods_wave = [
	[ "Finch", "Cardinal", "Cardinal" ],
	[ "Owl", "Bluebird" ],
	[ "Finch", "Owl", "Bluebird", "Bluebird" ]
];

ice_wave = [
	[ "Cardinal", "Bluebird", "Bluebird" ],
	[ "Owl", "Bluebird" ],
	[ "Owl", "Owl", "Bluebird", "Bluebird" ]
];

enemies_by_wave = [ woods_wave, woods_wave, woods_wave, ice_wave, ice_wave, ice_wave, woods_wave ];

spawn_wave = function() {	
	spawn_cooldown--;
	
	if n >= array_length(enemies_by_wave[area][wave]) || spawn_cooldown > 0 {
		return;
	}
	
	spawn_cooldown = max_spawn_cooldown;
	
	instance_create_layer(1440, 416, "Characters", obj_enemy,
	{
		type: enemies_by_wave[area][wave][n],
		stage: 0,
		image_xscale: 2,
		image_yscale: 2
	});
	
	global.living_enemies++;
	n++;
}

check_wave_dead = function() {	
	if global.living_enemies <= 0 && n != 0 &&
	wave + 1 < array_length(enemies_by_wave[area]) {
		n = 0;
		wave++;
	}
	else if global.living_enemies <= 0
	&& n != 0 && fireworks == 0 {
		alarm[0] = 1;
	}
}

next_area = function() {
	fireworks = 0;
	wave = 0;
	n = 0;
	area++;
	global.living_enemies = 0;
	obj_game_manager.lost = false;
	room = rooms_by_area[area];
}

repeat_area = function() {
	fireworks = 0;
	wave = 0;
	n = 0;
	global.living_enemies = 0;
	obj_game_manager.lost = false;
	room = rooms_by_area[area];
}

start_area = function(area_num) {
	fireworks = 0;
	wave = 0;
	n = 0;
	
	area = 0;
	
	for (i = 0; i < area_num; i++) {
		area += major_area_lengths[i];
	}
	
	global.living_enemies = 0;
	obj_game_manager.lost = false;
	room = rooms_by_area[area];
}

get_area = function(area_num) {
	temp_offset = 0;
	temp = 0;
	
	for (i = 0; i < area_num; i++) {
		temp_offset++;
		
		if temp_offset >= major_area_lengths[temp] {
			temp_offset = 0;
			temp++;
		}
	}
	
	return temp;
}

check_if_major_area_end = function(area_num) {
	temp = 0;
	i = 0;
	
	while (temp < area_num) {
		temp += major_area_lengths[i];
		i++;
	}
	
	return temp == area_num;
}