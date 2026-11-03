// play attack sound, can make check  for type later
switch type {
	case "Arrow":
		audio_play_sound(arrow_sfx, 5, false);
	case "Shock":
		audio_play_sound(shock_sfx, 5, false);
	case "Freeze":
		audio_play_sound(freeze_sfx, 5, false);
	case "Burn":
		audio_play_sound(fire_sfx, 5, false);
	default:
		audio_play_sound(arrow_sfx, 5, false);
}


moveSpeed = 5;
damage = 3;

image_xscale = .5;
image_yscale = .5;

rotateable = true;

apply_sprite = function() {
	switch type {
		case "Arrow":
			return spr_proj_arrow;
		case "Shock":
			return spr_proj_shock;
		case "Freeze":
			return spr_proj_freeze;
		case "Burn":
		rotateable = false;
			return spr_proj_fire;
		default:
			return spr_proj_arrow;
	}
}

sprite_index = apply_sprite();

fly_at_target = function() {
	// Checks appropriate distance to the target and points
	// the sprite. The catch statement deletes the arrow if the target
	// is killed. Ideally this could be fixed later on but it works
	try {
		xDiff = target.x - x;
		yDiff = target.y - y;
		
		if rotateable {
			image_angle = point_direction(x, y, target.x, target.y);
		}
		else {
			image_angle = 0;
		}
	}
	catch (ex) {
		instance_destroy();
		return;
	}
	
	// Has hit target, deals damage
	if abs(xDiff) <= moveSpeed && abs(yDiff) <= moveSpeed {
		status_applied(self, target);
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