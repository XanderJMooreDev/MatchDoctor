read_controls();
move();
switch_anims();
// This is for marker stuff
if (is_Holding && instance_exists(drop_marker_id)) {
    var marker_x = x;
    var marker_y = y;
	// Checks direction of player, gets coords 
    switch (facing) {
        case "up":
			marker_x -= 32;
            marker_y -= 86;
            break;

        case "down":
			marker_x -= 32;
            marker_y += 48;
            break;

        case "left":
            marker_x -= 86;
			marker_y -= 16;
            break;

        case "right":
            marker_x += 32;
			marker_y -= 16;
            break;
    }
	// Moves it accordingly 
	drop_marker_id.x = marker_x;
    drop_marker_id.y = marker_y;
}