// All functions relating to the various statuses should be in here

// Triggered when the status is applied, for setting the status and
// for statuses that only have a constant effect like Freeze slowing
// enemy move speed
function status_applied(projectile, defender) {
	if projectile.type == defender.status {
		return;
	}
	
	switch projectile.type {
		case "Freeze":
			effect_create_layer("Effects", ef_star, x, y, 2, c_teal);
			defender.status = "Freeze";
			defender.status_duration = 300;
			
			if (defender.object_index == obj_enemy) {
				defender.moveSpeed /= .5;
			}
			else if (defender.object_index == obj_temp_ally) {
				defender.maxCooldown *= 1.5;
			}
			
			return;
		case "Burn":
			defender.status = "Burn";
			defender.status_duration = 300;
			defender.status_cooldown = 0;
			defender.status_max_cooldown = 60;
			
			return;
		case "Shock":
			effect_create_layer("Effects", ef_star, x, y, 2, c_yellow);
			if (defender.object_index == obj_enemy) {
				defender.status = "Shock";
				defender.status_duration = 300;
			}
			
			return;
	}
}

// For statuses like "Burn" which have a repeating effect like chip damage
function status_tick() {
	if (status_duration <= 0) {
		status_remove();
		
		return;
	}
	
	status_duration--;
	
	if status_cooldown > 0 {
		status_cooldown--;
		
		return;
	}
	
	switch (status) {
		case "Burn":
			take_damage(1);
			status_cooldown = status_max_cooldown;
			effect_create_layer("Effects", ef_star, x, y, 2, c_red);
			break;
	}
}

function status_remove() {
	switch status {
		case "Freeze":
			if (object_index == obj_enemy) {
				status = "Freeze";
				moveSpeed /= .5;
			}
			else if (object_index == obj_temp_ally) {
				maxCooldown /= 1.5;
			}
			
			break;
	}
	
	status = "None";
}