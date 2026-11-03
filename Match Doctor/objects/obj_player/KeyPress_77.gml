var menu_Key = keyboard_check_pressed(ord("M"));

if (menu_Key) {
	if (infoVis = false){
		layer_set_visible(info_Layer, true)
		infoVis = true;
	} else {
		layer_set_visible(info_Layer, false)
		infoVis = false;
	}
}