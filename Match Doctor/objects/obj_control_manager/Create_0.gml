// Simple way to have a customizable controller that can be created easily
function Controller(_up, _down, _left, _right, _run, _pickup, _dance, _pause,
_sup, _sdown, _sleft, _sright, _placement_mode = "Auto", _controller = noone) constructor {
	up = _up;
	down = _down;
	left = _left;
	right = _right;
	
	run = _run;
	
	pickup = _pickup;
	dance = _dance;
	pause = _pause;
	
	sup = _sup;
	sdown = _sdown;
	sleft = _sleft;
	sright = _sright;
	
	placement_mode = _placement_mode;
	
	controller = _controller;
	
	// Placeholder to possible eventually allow actual controllers
	if controller != noone {
		controller_type = "Controller";
	}
	else {
		controller_type = "Keyboard";
	}
	
	function c_by(ctl) {
		return variable_instance_get(self, ctl);
	}
	
	// Determine if a button is pressed, also you can just specify the name of the
	// command to get it
	function get_control_input_tap(control) {
		if (typeof(control) == "string") {
			control = variable_instance_get(self, control);
		}
		
		if controller_type == "Keyboard" {
			return keyboard_check_pressed(control);
		}
		else if controller_type == "Controller" {
			return gamepad_button_check_pressed(controller, control);
		}
	}
	
	// Same as above, but to check if a button is being held
	function get_control_input_hold(control) {
		if (typeof(control) == "string") {
			control = variable_instance_get(self, control);
		}
		
		if controller_type == "Keyboard" {
			return keyboard_check(control);
		}
		else if controller_type == "Controller" {
			return gamepad_button_check(controller, control);
		}
	}
	
	// Call the above functions to easily read joysticks (or virtual joysticks for
	// keyboard input)
	function get_joystick_x() {
		return get_control_input_hold(right) - get_control_input_hold(left);
	}
	
	function get_joystick_y() {
		return get_control_input_hold(down) - get_control_input_hold(up);
	}
	
	function get_joystick_sx() {
		return get_control_input_hold(sright) - get_control_input_hold(sleft);
	}
	
	function get_joystick_sy() {
		return get_control_input_hold(sdown) - get_control_input_hold(sup);
	}
	
	// Allows you to check if the user tries to navigate left or right (or, hypothetically,
	// up or down)
	function any_joystick(dir) {
		adir = variable_instance_get(self, dir);
		sdir = variable_instance_get(self, string_concat("s", dir));
		
		return get_control_input_tap(adir) || get_control_input_tap(sdir);
	}
}

controller = new Controller(
	ord("W"), ord("S"), ord("A"), ord("D"), ord("M"), ord("E"), ord("Y"), vk_enter, 
	vk_up, vk_down, vk_left, vk_right
);