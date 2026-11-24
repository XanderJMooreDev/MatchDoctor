// Placeholder to make them face left
image_xscale *= -1;

multiplier = 0;

// Specific hitbox offset to line up
centralizeOffset = 60;

// Any type of object that can be attacked by enemies
targetable_objects = [ obj_temp_ally, obj_nest ];

path_object = layer_tilemap_get_id("Tiles_Path");

status = "None";
status_cooldown = 0;
status_max_cooldown = 0;
status_duration = 0;

multiplier = 0;

create_by_type = function() {
	stats = EnemyStats(type, stage);
	
	maxHp = stats.maxHp;
	sprite = stats.sprite;
	deadSprite = stats.deadSprite;
	moveSpeed = stats.moveSpeed;
	maxCooldown = stats.maxCooldown;
	rangeType = stats.rangeType;
	scoreValue = stats.scoreValue;
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
	if (check_block(x - 16, y, 
	path_object)) || x > room_width - 30 {
		x -= moveSpeed;
		
		multiplier = 0;
		
		// Stops code if the condition is met
		return;
	}
	
	offsetY = 0;
	
	can_go_up = false;
	can_go_down = false;
	
	if multiplier == 0 {
		// Continually checks for path to the left until the path vertically ends. 
		// If the path doesn't extend further, for now, we just stop moving. 
		while !check_block(x - 16, y - offsetY, path_object) &&
		check_block(x, y - offsetY, path_object) {
			offsetY += 16;
		}
		
		can_go_down = check_block(x - 16, y - offsetY, path_object);
		
		while !check_block(x - 16, y + offsetY, path_object) &&
		check_block(x, y + offsetY, path_object) {
			offsetY += 16;
		}
		
		can_go_up = (check_block(x - 16, y + offsetY, path_object));
		
		if (can_go_down && irandom_range(0, 1) == 0) || !can_go_up {
			multiplier = -1;
		}
		else {
			multiplier = 1;
		}
	}
	
	// Moves in the desired direction
	y += moveSpeed * multiplier;
}

check_block = function(cx, cy, obj) {
	spacer = 24;
	
	if position_meeting(cx + spacer, cy + spacer, obj) &&
	position_meeting(cx - spacer, cy - spacer, obj) &&
	position_meeting(cx - spacer, cy + spacer, obj) &&
	position_meeting(cx + spacer, cy - spacer, obj) {
		return true;
	}
	
	return false;
}

take_damage = function(damage) {
	hp -= damage;
	
	if hp <= 0 {
		global.living_enemies--;
		
		obj_score_manager.area_score += scoreValue;
		
		instance_create_layer(x, y, "Characters", obj_fallen_enemy,
		{
			type: self.type,
			stage: self.stage,
			sprite_index: self.deadSprite
		});
		
		instance_destroy();
	}
}