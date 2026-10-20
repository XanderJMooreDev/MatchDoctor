image_xscale = -2;
image_yscale = -2;

// We call this to spawn an ally if placed down off of the path.
// Small detail but we only need to save the type, rather than updating
// parameters because they get updated in the ally object instead
place = function() {
	if place_meeting(x, y, layer_tilemap_get_id("Tiles_Path")) {
		return;
	}
	
	instance_create_layer(x, y, "Characters", obj_temp_ally,
	{
		type: self.type
	});
	
	instance_destroy();
}