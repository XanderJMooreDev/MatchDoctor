maxHp = 50;
hp = maxHp;

status = "None";
status_cooldown = 0;
status_max_cooldown = 0;
status_duration = 0;


// This can likely be exactly copied into the ally troops when added
take_damage = function(damage) {
	hp -= damage;
	
	if hp <= 0 {
		instance_destroy();
	}
}