// Placeholder to make them face left
image_xscale *= -1;

// Specific hitbox offset to line up
centralizeOffset = 60;

// Any type of object that can be attacked by enemies
targetable_objects = [ obj_temp_ally, obj_nest ];

path_object = layer_tilemap_get_id("Tiles_Path");

rangeType = "Arrow";

create_by_type = function() {
	stats = EnemyStats(type);
	
	maxHp = stats.maxHp;
	sprite_index = stats.sprite;
	moveSpeed = stats.moveSpeed;
	maxCooldown = stats.maxCooldown;
}

// Assigns base stats in scr_enemy_type_stats based on the type assigned
// in the obj_wave_manager
create_by_type();
hp = maxHp;
cooldown = maxCooldown;

// This pathfinding doesn't yet allow for randomly selecting between
// non-equal paths, making branching paths pointless. Needs an update
pathfind = function() {
	// If standing near the nest, stop moving
	if place_meeting(x - centralizeOffset, y, obj_nest) ||
	x < 100 {
		return;
	}
	
	// If you have path to the left, you will take it. Checks from the top and bottom
	// of the sprite to line up better with the center
	if place_meeting(x - centralizeOffset, y - centralizeOffset, 
	path_object)
	&& place_meeting(x - centralizeOffset, y + centralizeOffset, 
	path_object) {
		x -= moveSpeed;
		
		// Stops code if the condition is met
		return;
	}
	
	offsetY = 0;
	
	// Determines the nearest path that leads to the left, continually checking
	// upwards and downwards at increasing distances
	while !place_meeting(x - centralizeOffset, y - centralizeOffset - offsetY, path_object) &&
	!place_meeting(x - centralizeOffset, y + centralizeOffset + offsetY, path_object) {
		offsetY++;
	}
	
	// Determines whether the detected path was up or down
	multiplier = place_meeting(x - centralizeOffset, y + centralizeOffset + offsetY, path_object)
	- place_meeting(x - centralizeOffset, y - centralizeOffset - offsetY, path_object);
	
	// If somehow the paths are exactly equidistant, it just picks randomly
	if multiplier == 0 {
		if irandom_range(1, 2) == 1 {
			multiplier = 1;
		}
		else {
			multiplier = -1;
		}
	}
	
	// Moves in the desired direction
	y += moveSpeed * multiplier;
}

take_damage = function(damage) {
	hp -= damage;
	
	if hp <= 0 {
		global.living_enemies--;
		
		instance_create_layer(x, y, "Characters", obj_fallen_enemy,
		{
			type: self.type,
			sprite_index: self.sprite_index
		});
		
		instance_destroy();
	}
}