// When you win a wave, we create some fireworks until done
// Then, we move on to the next area. We may want to consider
// some type of world map, perhaps?
if fireworks < 6 {
	effect_create_layer("Effects", ef_firework, 
	irandom_range(0, room_width), irandom_range(0, room_height), 
	3, rainbow[fireworks]);
	
	fireworks++;
	
	alarm[0] = 60;
}
else {	
	obj_game_manager.selecting_bird = true;
	obj_game_manager.game_paused = true;
}