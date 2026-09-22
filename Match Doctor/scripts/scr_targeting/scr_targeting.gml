// Accessible from anywhere
function find_nearest(targets, currX, currY) {
	// Sets these variables very high so that, when a closer target
	// is found, it will certainly be closer than the maximum range.
	// By default, there is no target
	nearestXDiff = 300;
	nearestYDiff = 300;
	nearestTarget = noone;
	
	// Loops through each instance of each targetable object, using
	// two loops, and setting only the closest target to be attacked to
	// allow only one target
	for (i = 0; i < array_length(targets); i++) {
		for (j = 0; j < instance_number(targets[i]); j++) {
			currTarget = instance_find(targets[i], j);
			
			// If you're closer to the current target than the last
			// closest target, replace the nearest target
			if nearestTarget == noone {
				if measure_dist(currTarget, currX, currY) < 300 {
					nearestTarget = currTarget;
				}
			}
			else if measure_dist(currTarget, currX, currY) < 
			measure_dist(nearestTarget, currX, currY) {
				nearestTarget = currTarget;
			}
		}
	}
}

// Simplifies checking the distane between two points by doing
// Pythagorean Theorem
function measure_dist(target, currX, currY) {
	a = abs(currX - target.x);
	b = abs(currY - target.y);
	
	return sqrt(sqr(a) + sqr(b));
}

// Shoot projectiles at target
function shoot_foe(targetable_objects) {
	// Ensures you aren't constantly shooting at targets
	if cooldown <= 0 {
		cooldown = maxCooldown;
	}
	else {
		cooldown--;
		return;
	}
	
	// Calls a function from above to find the nearest foe
	nearest_target = find_nearest(targetable_objects, x, y);
	
	// At this point, the closest targetable object is set to 
	// nearestTarget
	if nearestTarget == noone {
		return;
	}
	
	if rangeType != "None" {
		proj = instance_create_layer(x, y, "Characters", obj_projectile,
		{
			target : nearestTarget,
			type: rangeType
		});
	}
}