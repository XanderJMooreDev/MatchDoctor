maxHp = 50;
hp = maxHp;

// This can likely be exactly copied into the ally troops when added
take_damage = function(damage) {
	hp -= damage;
	
	if hp <= 0 {
		instance_destroy();
	}
}