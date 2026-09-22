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