// Allows a set of enemy types to be created easily
function EnemyType(_name, _sprite, _deadSprite, _maxHp, _maxCooldown, _moveSpeed, _rangeType) constructor {
	name = _name;
	sprite = _sprite;
	deadSprite = _deadSprite;
	maxHp = _maxHp;
	maxCooldown = _maxCooldown;
	moveSpeed = _moveSpeed;
	rangeType = _rangeType;
}

// Returns a compatible EnemyType based on a matching name
function EnemyStats(name) {
	enemy_types = [
		new EnemyType("Owl", spr_enemy1_fly, spr_enemy1_dead, 50, 30, 2, "Arrow"),
		new EnemyType("Bluebird", spr_temp_enemy_1, spr_enemy1_dead, 60, 40, 1.5, "Arrow"),
		new EnemyType("Cardinal", spr_temp_enemy_2, spr_enemy1_dead, 65, 30, 2, "Burn")
	];
	
	for (i = 0; i < array_length(enemy_types); i++) {
		if enemy_types[i].name == name {
			return enemy_types[i];
		}
	}
	
	// Default value
	return new EnemyType("Owl", spr_enemy1_fly, spr_enemy1_dead, 50, 30, 2, "Arrow");
}