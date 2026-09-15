for (i = 0; i < instance_number(obj_enemy_projectile); i++) {
	if instance_find(obj_enemy_projectile, i).target == self {
		instance_destroy(instance_find(obj_enemy_projectile, i));
	}
}