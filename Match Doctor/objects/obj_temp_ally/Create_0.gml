maxHp = 12;
hp = maxHp;

maxCooldown = 30;
cooldown = maxCooldown;

rangeType = "Arrow";

targetable_objects = [ obj_enemy ];

// This can likely be exactly copied into the ally troops when added
take_damage = function(damage) {
	hp -= damage;
	
	if hp <= 0 {
		instance_destroy();
	}
}