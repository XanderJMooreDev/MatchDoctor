// Allows a set of enemy types to be created easily
function EnemyType(_name, _stage, _sprite, _deadSprite, _maxHp, _maxCooldown, _moveSpeed, _rangeType, _scoreValue) constructor {
	name = _name;
	stage = _stage;
	sprite = _sprite;
	deadSprite = _deadSprite;
	maxHp = _maxHp;
	maxCooldown = _maxCooldown;
	moveSpeed = _moveSpeed;
	rangeType = _rangeType;
	scoreValue = _scoreValue
}

// Returns a compatible EnemyType based on a matching name
function EnemyStats(name, stage = 0) {
	enemy_types = [
		new EnemyType("Owl", 0, spr_enemy1_fly, spr_enemy1_dead, 50, 30, 2, "Arrow", 100),
		new EnemyType("Owl", 1, spr_enemy2_fly, spr_enemy1_dead, 150, 10, 2, "Arrow", 300),
		new EnemyType("Bluebird", 0, spr_enemy5_fly, spr_enemy5_dead, 60, 40, 1.5, "Freeze", 200),
		new EnemyType("Cardinal", 0, spr_enemy3_fly, spr_enemy3_dead, 65, 30, 2, "Burn", 200),
		new EnemyType("Finch", 0, spr_enemy6_fly, spr_enemy6_dead, 42, 20, 2.5, "Shock", 250),
		new EnemyType("Hartman", 0, spr_hartman_green, spr_enemy1_dead, 200, 40, 1, "Arrow", 1000),
		new EnemyType("Hartman", 1, spr_hartman_yellow, spr_enemy1_dead, 220, 30, 1, "Varies", 200)
	];
	
	// Allows you to fetch the nth bird from the list
	if (name == "ByID") {
		return enemy_types[stage];
	}
	
	// Allows you to fetch the amount of birds stored
	if (name == "Count") {
		return array_length(enemy_types);
	}
	
	for (i = 0; i < array_length(enemy_types); i++) {
		if enemy_types[i].name == name && enemy_types[i].stage == stage {
			obj_bird_menu_manager.birds_seen[i] = true;
			return enemy_types[i];
		}
	}
	
	// Default value
	return new EnemyType("Owl", 0, spr_enemy1_fly, spr_enemy1_dead, 50, 30, 2, "Arrow", 100);
}