// Placeholder to make them face left
image_xscale *= -1;

// Specific hitbox offset to line up
centralizeOffset = 60;

// Higher the speed, the faster the bird moves through the path
moveSpeed = 2;

// Any type of object that can be attacked by enemies
targetable_objects = [ obj_temp_ally ];

rangeType = "Arrow";

maxCooldown = 30;
cooldown = maxCooldown;

// This pathfinding doesn't yet allow for randomly selecting between
// non-equal paths, making branching paths pointless. Needs an update
pathfind = function() {
	// If you have path to the left, you will take it. Checks from the top and bottom
	// of the sprite to line up better with the center
	if place_meeting(x - centralizeOffset, y - centralizeOffset, obj_temp_path)
	&& place_meeting(x - centralizeOffset, y + centralizeOffset, obj_temp_path) {
		x -= moveSpeed;
		
		// Stops code if the condition is met
		return;
	}
	
	offsetY = 0;
	
	// Determines the nearest path that leads to the left, continually checking
	// upwards and downwards at increasing distances
	while !place_meeting(x - centralizeOffset, y - centralizeOffset - offsetY, obj_temp_path) &&
	!place_meeting(x - centralizeOffset, y + centralizeOffset + offsetY, obj_temp_path) {
		offsetY++;
	}
	
	// Determines whether the detected path was up or down
	multiplier = place_meeting(x - centralizeOffset, y + centralizeOffset + offsetY, obj_temp_path)
	- place_meeting(x - centralizeOffset, y - centralizeOffset - offsetY, obj_temp_path);
	
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

target_foes = function() {
	// Ensures you aren't constantly shooting at targets
	if cooldown <= 0 {
		cooldown = maxCooldown;
	}
	else {
		cooldown--;
		return;
	}
	
	// Sets these variables very high so that, when a closer target
	// is found, it will certainly be closer than the maximum range.
	// By default, there is no target
	nearestXDiff = 300;
	nearestYDiff = 300;
	nearestTarget = noone;
	
	// Loops through each instance of each targetable object, using
	// two loops, and setting only the closest target to be attacked to
	// allow only one target
	for (i = 0; i < array_length(targetable_objects); i++) {
		for (j = 0; j < instance_number(targetable_objects[i]); j++) {
			currTarget = instance_find(targetable_objects[i], j);
			
			// If you're closer to the current target than the last
			// closest target, replace the nearest target
			if nearestTarget == noone {
				if measure_dist(currTarget) < 300 {
					nearestTarget = currTarget;
				}
			}
			else if measure_dist(currTarget) < measure_dist(nearestTarget) {
				nearestTarget = currTarget;
			}
		}
	}
	
	// At this point, the closest targetable object is set to 
	// nearestTarget
	if nearestTarget == noone {
		return;
	}
	
	if rangeType != "None" {
		proj = instance_create_layer(x, y, "Characters", obj_enemy_projectile,
		{
			target : nearestTarget,
			type: rangeType
		});
	}
}

// Simplifies checking the distane between two points by doing
// Pythagorean Theorem
measure_dist = function(target) {
	a = abs(x - target.x);
	b = abs(y - target.y);
	
	return sqrt(sqr(a) + sqr(b));
}