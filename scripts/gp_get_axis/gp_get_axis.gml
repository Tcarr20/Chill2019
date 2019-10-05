///@function gp_get_axis(input, device, player)
///@description Check if the left axis is in the given sector
///@param input
///@param device
///@param player
var c=argument0, g=argument1, p=argument2;
var in = [gamepad_axis_value(g, gp_axislh), gamepad_axis_value(g, gp_axislv)];
var len = point_to_point(0, 0, in[X], in[Y]);
//show_message(len)
if (len < global.gp_axis_thresh[p]) { return false; }
else {
	//Pre-rotate input
	var rot = [0, 0], rot_sin = dsin(gp_axis_pre_rotation), rot_cos = dcos(gp_axis_pre_rotation);
	rot[X] = rot_cos*in[X] - rot_sin*in[Y];
	rot[Y] = rot_sin*in[X] + rot_cos*in[Y];

	//Normalize the input vector
	var norm = [in[X] / len, in[Y] / len];
		
	//Calculate the vectors sector
	var sector_h = dsin(gp_axis_sector_angle / 2);
	var out = [0, 0];
	out[X] = abs(norm[X]) > sector_h? sign(norm[X]) : 0;
	out[Y] = abs(norm[Y]) > sector_h? sign(norm[Y]) : 0;
		
	//Return vector
		 if (c == in_left && out[X] < 0 && out[Y] == 0) { return true; }
	else if (c == in_right && out[X] > 0 && out[Y] == 0) { return true; }
	else if (c == in_up && out[X] == 0 && out[Y] < 0) { return true; }
	else if (c == in_down && out[X] == 0 && out[Y] > 0) { return true; }
	else if (c == in_down_left && out[X] < 0 && out[Y] > 0) { return true; }
	else if (c == in_down_right && out[X] > 0 && out[Y] > 0) { return true; }
	else if (c == in_up_left && out[X] < 0 && out[Y] < 0) { return true; }
	else if (c == in_up_right && out[X] > 0 && out[Y] < 0) { return true; }
	else {return false;}
}