if keyboard_check(vk_escape) {
	debug = true;
}

if !debug {
	return;
}

check_debug_controls();
check_speedup();