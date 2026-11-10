image_xscale = 2;
image_yscale = 2;

show_debug_message(stage);

status = "None";
status_cooldown = 0;
status_max_cooldown = 0;
status_duration = 0;

// Copied essentially from obj_enemy but without unused parameters
create_by_type = function() {
	stats = EnemyStats(type, stage);
	
	sprite_index = stats.sprite;
	maxHp = stats.maxHp;
	maxCooldown = stats.maxCooldown;
	rangeType = stats.rangeType;
	scoreValue = stats.scoreValue;
	stage = stats.stage;
}

create_by_type();

hp = maxHp;
cooldown = maxCooldown;

targetable_objects = [ obj_enemy ];

// This can likely be exactly copied into the ally troops when added
take_damage = function(damage) {
	hp -= damage;
	
	if hp <= 0 {
		obj_score_manager.area_score -= scoreValue / (1 + stage);
		
		instance_destroy();
	}
}