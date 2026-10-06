area = 0;
wave = 0;

global.living_enemies = 0;

n = 0;

spawn_cooldown = 0;
max_spawn_cooldown = 30;

woods_wave = [
	[ "Owl", "Owl", "Owl" ],
	[ "Owl", "Bluebird" ],
	[ "Owl", "Owl", "Bluebird", "Bluebird" ]
];

enemies_by_wave = [ woods_wave ];

spawn_wave = function() {	
	spawn_cooldown--;
	
	if n >= array_length(enemies_by_wave[area][wave]) || spawn_cooldown > 0 {
		return;
	}
	
	spawn_cooldown = max_spawn_cooldown;
	
	instance_create_layer(1440, 416, "Characters", obj_enemy,
	{
		type: enemies_by_wave[area][wave][n],
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
}