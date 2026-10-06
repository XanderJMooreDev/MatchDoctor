// Allows a set of enemy types to be created easily
function EnemyType(_name, _sprite, _maxHp, _maxCooldown, _moveSpeed) constructor {
	name = _name;
	sprite = _sprite;
	maxHp = _maxHp;
	maxCooldown = _maxCooldown;
	moveSpeed = _moveSpeed;
}

// Returns a compatible EnemyType based on a matching name
function EnemyStats(name) {
	enemy_types = [
		new EnemyType("Owl", spr_temp_enemy, 20, 30, 2),
		new EnemyType("Bluebird", spr_temp_enemy_1, 30, 40, 1.5)
	];
	
	for (i = 0; i < array_length(enemy_types); i++) {
		if enemy_types[i].name == name {
			return enemy_types[i];
		}
	}
	
	// Default value
	return new EnemyType("Owl", spr_temp_enemy, 20, 30, 2);
}