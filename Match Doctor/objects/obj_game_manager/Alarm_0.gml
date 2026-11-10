obj_player.held_block = held_block;
obj_player.held_type = held_type;
obj_player.held_stage = held_stage;
obj_player.held_sprite = held_sprite;
obj_player.is_Holding = true;
obj_player.held_hp = EnemyStats(held_type, held_stage).maxHp;

if (!instance_exists(drop_marker)) {
	obj_player.drop_marker_id = instance_create_layer(x, y, "Characters", drop_marker, {
		sprite_index: held_sprite,
		image_alpha: .75,
		image_xscale: 2,
		image_yscale: 2
	});
}