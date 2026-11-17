function hartman_merge(hartman, element) {
	show_debug_message("Hartman merge");
	hartman_element = element.rangeType;
	show_debug_message(hartman.hartman_element);
	hartman.stage = 1;
	
	inst = instance_create_layer(drop_marker.x, drop_marker.y, "Characters", hartman,
	{
		type: "Hartman",
		stage: 1,
		rangeType: hartman_element,
		sprite_index: hartman_sprite(hartman_element)
	});
				
	// After creating an enemy object, we try to place it alive
	// as a troop. This is temporary until we add reviving
	if inst.object_index == obj_fallen_enemy {
		inst.place();
	}
	else {
		inst.hp = held_hp;
	}
	
	if (instance_exists(drop_marker)){
		instance_destroy(drop_marker);
	}
	// Setting original values back so they can be used again 
    is_Holding = false;
    held_block = noone;
	
	instance_destroy(element);
	return hartman;
}

function hartman_sprite(elem) {
	switch elem {
		case "Arrow":
			return spr_hartman_brown;
		case "Burn":
			return spr_hartman_red;
		case "Freeze":
			return spr_hartman_blue;
		case "Shock":
			return spr_hartman_yellow;
	}
	
	return spr_enemy1_dead;
}