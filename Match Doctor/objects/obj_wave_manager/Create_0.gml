area = 0;
wave = 0;

fireworks = 0;
rainbow = [ c_red, c_orange, c_yellow, c_green,
c_blue, c_purple ];

global.living_enemies = 0;

n = 0;

spawn_cooldown = 300;
max_spawn_cooldown = 30;

rooms_by_area = [ room_woods, room_ice, room_startup ];

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

enemies_by_wave = [ woods_wave, ice_wave ];

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
	if global.living_enemies <= 0 && 
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
	wave = 0;
	n = 0;
	area++;
	room = rooms_by_area[area];
}