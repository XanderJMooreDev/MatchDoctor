read_controls();
move();
switch_anims();
// This is for marker stuff
if (is_Holding && instance_exists(drop_marker_id)) {
    marker_x = x;
    marker_y = y;
	// Checks direction of player, gets coords 
    switch (facing) {
        case "up":
            marker_y -= 96;
            break;

        case "down":
            marker_y += 96;
            break;

        case "left":
            marker_x -= 96;
            break;

        case "right":
            marker_x += 96;
            break;
    }
	
	marker_x = round((marker_x - 32) / 32) * 32 + 32;
	marker_y = round((marker_y) / 32) * 32;
	
	// Moves it accordingly 
	drop_marker_id.x = marker_x;
    drop_marker_id.y = marker_y;
}