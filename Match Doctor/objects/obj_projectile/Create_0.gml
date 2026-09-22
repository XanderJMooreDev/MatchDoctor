moveSpeed = 5;
damage = 3;

image_xscale = .5;
image_yscale = .5;

fly_at_target = function() {
	// Checks appropriate distance to the target and points
	// the sprite. The catch statement deletes the arrow if the target
	// is killed. Ideally this could be fixed later on but it works
	try {
		xDiff = target.x - x;
		yDiff = target.y - y;
		
		image_angle = point_direction(x, y, target.x, target.y);
	}
	catch (ex) {
		instance_destroy();
		return;
	}
	
	// Has hit target, deals damage
	if abs(xDiff) <= moveSpeed && abs(yDiff) <= moveSpeed {
		target.take_damage(damage);
		instance_destroy();
	}
	
	// We convert the difference on position into a proportional
	// relationship, where the max x or y speed is set to max speed,
	// and the smaller value is scaled proportionally
	if abs(xDiff) > abs(yDiff) {
		x += moveSpeed * (xDiff / abs(xDiff));
		y += moveSpeed * (yDiff / abs(xDiff));
	}
	else {
		y += moveSpeed * (yDiff / abs(yDiff));
		x += moveSpeed * (xDiff / abs(yDiff));
	}
}