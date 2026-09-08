// Placeholder to make them face left
image_xscale *= -1;

// Specific hitbox offset to line up
centralizeOffset = 60;

// Higher the speed, the faster the bird moves through the path
moveSpeed = 2;

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