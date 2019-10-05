///@description Update camera gamepads
//Update camera position
if (x != xprevious || y != yprevious) {
	//Clamp position to room bounds
	x = clamp(x, (ideal_w/2), room_width-(ideal_w/2));
	y = clamp(y, (ideal_h/2), room_height-(ideal_h/2));
	//Update camera position
	camera = view_get_camera(0);
	var vm = matrix_build_lookat(x, y, -1000, x, y, 0, 0, 1, 0);
	camera_set_view_mat(camera, vm);
	view_camera[0] = camera;
}

//Handle frame timer
global.frameTimer = (global.frameTimer + 1) mod GAME_SPEED;

//Manage gamepad input flags
for(var i=0; i<NUM_PLAYERS; i++) {
	global.c_axisl_l[i] = gp_get_axis(in_left, global.gp_slot[i], i);
	global.c_axisl_r[i] = gp_get_axis(in_right, global.gp_slot[i], i);
	global.c_axisl_u[i] = gp_get_axis(in_up, global.gp_slot[i], i);
	global.c_axisl_d[i] = gp_get_axis(in_down, global.gp_slot[i], i);
	global.c_axisl_dl[i] = gp_get_axis(in_down_left, global.gp_slot[i], i);
	global.c_axisl_dr[i] = gp_get_axis(in_down_right, global.gp_slot[i], i);
	global.c_axisl_ul[i] = gp_get_axis(in_up_left, global.gp_slot[i], i);
	global.c_axisl_ur[i] = gp_get_axis(in_up_right, global.gp_slot[i], i);
	global.c_trig_l[i] = (gamepad_button_value(global.gp_slot[i], gp_shoulderlb)>global.gp_trig_thresh[i]);
	global.c_trig_r[i] = (gamepad_button_value(global.gp_slot[i], gp_shoulderrb)>global.gp_trig_thresh[i]);
}