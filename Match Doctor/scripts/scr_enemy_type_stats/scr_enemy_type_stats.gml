// Allows a set of enemy types to be created easily
function EnemyType(_name, _stage, _sprite, _deadSprite, _maxHp, _maxCooldown, _moveSpeed, _rangeType) constructor {
	name = _name;
	stage = _stage;
	sprite = _sprite;
	deadSprite = _deadSprite;
	maxHp = _maxHp;
	maxCooldown = _maxCooldown;
	moveSpeed = _moveSpeed;
	rangeType = _rangeType;
}

// Returns a compatible EnemyType based on a matching name
function EnemyStats(name, stage) {
	enemy_types = [
		new EnemyType("Owl", 0, spr_enemy1_fly, spr_enemy1_dead, 50, 30, 2, "Arrow"),
		new EnemyType("Owl", 1, spr_enemy2_fly, spr_enemy1_dead, 150, 10, 2, "Arrow"),
		new EnemyType("Bluebird", 0, spr_enemy5_fly, spr_enemy1_dead, 60, 40, 1.5, "Freeze"),
		new EnemyType("Cardinal", 0, spr_enemy3_fly, spr_enemy1_dead, 65, 30, 2, "Burn"),
		new EnemyType("Finch", 0, spr_enemy6_fly, spr_enemy1_dead, 42, 20, 2.5, "Shock")
	];
	
	for (i = 0; i < array_length(enemy_types); i++) {
		if enemy_types[i].name == name && enemy_types[i].stage == stage {
			return enemy_types[i];
		}
	}
	
	// Default value
	return new EnemyType("Owl", 0, spr_enemy1_fly, spr_enemy1_dead, 50, 30, 2, "Arrow");
}