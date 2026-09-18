// Placeholder code for drawing sprite. Will be updated when sprites are updated
draw_sprite_ext(spr_temp_path, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);

// Draws the health bar as a proportion of the total frames
draw_sprite_ext(spr_temp_health, (hp / maxHp) * 
sprite_get_number(spr_temp_health) - 1, x, y - 120, 1, 1, 0, c_white, 1);