function hartman_merge(hartman, element){
	show_debug_message("Hartman merge");
	show_debug_message(element.type);
	switch element.type{
		case "Finch":
			hartman.hartman_element = "Shock";
			instance_destroy(element);
			break;
		case "Cardinal":
			hartman.hartman_element = "Afterburn";
			instance_destroy(element);
			break;
		case "Bluebird":
			hartman.hartman_element = "Freeze";
			instance_destroy(element);
			break;
		case "Owl":
			hartman.hartman_element = "None";
			break;
	}
	show_debug_message(hartman.hartman_element);
	return hartman;
}