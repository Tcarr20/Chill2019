///@function get_in(input, state, player)
///@description Polls if given input is pressed, held, or released for the given player
///@param input
///@param state
///@param player
var c=argument0, d=argument1, p=argument2;
switch(c)
{
    case in_a:
			 if (d==in_check_press) {return gamepad_button_check_pressed(global.gp_slot[p], gp_face1);}
	    else if (d==in_check_hold) {return gamepad_button_check(global.gp_slot[p], gp_face1);}
	    else if (d==in_check_release) {return gamepad_button_check_released(global.gp_slot[p], gp_face1);}
    break;
    case in_b:
			 if (d==in_check_press) {return gamepad_button_check_pressed(global.gp_slot[p], gp_face2);}
	    else if (d==in_check_hold) {return gamepad_button_check(global.gp_slot[p], gp_face2);}
	    else if (d==in_check_release) {return gamepad_button_check_released(global.gp_slot[p], gp_face2);}
    break;
	case in_x:
			 if (d==in_check_press) {return gamepad_button_check_pressed(global.gp_slot[p], gp_face3);}
	    else if (d==in_check_hold) {return gamepad_button_check(global.gp_slot[p], gp_face3);}
	    else if (d==in_check_release) {return gamepad_button_check_released(global.gp_slot[p], gp_face3);}
    break;
	case in_y:
			 if (d==in_check_press) {return gamepad_button_check_pressed(global.gp_slot[p], gp_face4);}
	    else if (d==in_check_hold) {return gamepad_button_check(global.gp_slot[p], gp_face4);}
	    else if (d==in_check_release) {return gamepad_button_check_released(global.gp_slot[p], gp_face4);}
    break;
    case in_start:
			 if (d==in_check_press) {return gamepad_button_check_pressed(global.gp_slot[p], gp_start);}
        else if (d==in_check_hold) {return gamepad_button_check(global.gp_slot[p], gp_start);}
        else if (d==in_check_release) {return gamepad_button_check_released(global.gp_slot[p], gp_start);}
    break;
    case in_select:
			 if (d==in_check_press) {return gamepad_button_check_pressed(global.gp_slot[p], gp_select);}
        else if (d==in_check_hold) {return gamepad_button_check(global.gp_slot[p], gp_select);}
        else if (d==in_check_release) {return gamepad_button_check_released(global.gp_slot[p], gp_select);}
    break;
	case in_lshoulder:
			 if (d==in_check_press) {return gamepad_button_check_pressed(global.gp_slot[p], gp_shoulderl);}
	    else if (d==in_check_hold) {return gamepad_button_check(global.gp_slot[p], gp_shoulderl);}
	    else if (d==in_check_release) {return gamepad_button_check_released(global.gp_slot[p], gp_shoulderl);}
    break;
	case in_rshoulder:
			 if (d==in_check_press) {return gamepad_button_check_pressed(global.gp_slot[p], gp_shoulderr);}
	    else if (d==in_check_hold) {return gamepad_button_check(global.gp_slot[p], gp_shoulderr);}
	    else if (d==in_check_release) {return gamepad_button_check_released(global.gp_slot[p], gp_shoulderr);}
    break;
	case in_ltrigger:
		if (d==in_check_press) {
			if (global.c_trig_l) {return false;}
		    else {return (gamepad_button_value(global.gp_slot[p], gp_shoulderlb)>(global.gp_trig_thresh[p]));}
		}
	    else if (d==in_check_hold) {return (gamepad_button_value(global.gp_slot[p], gp_shoulderlb)>(global.gp_trig_thresh[p]));}
	    else if (d==in_check_release) {
			if (gamepad_button_value(global.gp_slot[p], gp_shoulderlb)<=(global.gp_trig_thresh[p])) {return global.c_trig_l;}
			else {return false;}
		}
    break;
	case in_rtrigger:
		if (d==in_check_press) {
			if (global.c_trig_r) {return false;}
		    else {return (gamepad_button_value(global.gp_slot[p], gp_shoulderrb)>(global.gp_trig_thresh[p]));}
		}
	    else if (d==in_check_hold) {return (gamepad_button_value(global.gp_slot[p], gp_shoulderrb)>(global.gp_trig_thresh[p]));}
	    else if (d==in_check_release) {
			if (gamepad_button_value(global.gp_slot[p], gp_shoulderlb)<=(global.gp_trig_thresh[p])) {return global.c_trig_r;}
			else {return false;}
		}
    break;
    case in_up:
		var _axis_check = gp_get_axis(in_up, global.gp_slot[p], p);
		if (d==in_check_press) {
			if (global.c_axisl_u) {return false;}
			else {return _axis_check;}
		}
        else if (d==in_check_hold) {return _axis_check;}
        else if (d==in_check_release) {
			if (_axis_check) {return global.c_axisl_u;}
			else {return false;}
		}
    break;
    case in_down:
		var _axis_check = gp_get_axis(in_down, global.gp_slot[p], p);
		if (d==in_check_press) {
			if (global.c_axisl_d) {return false;}
			else {return _axis_check;}
		}
        else if (d==in_check_hold) {return _axis_check;}
        else if (d==in_check_release) {
			if (_axis_check) {return global.c_axisl_d;}
			else {return false;}
		}
    break;
    case in_left:
		var _axis_check = gp_get_axis(in_left, global.gp_slot[p], p);
		if (d==in_check_press) {
			if (global.c_axisl_l) {return false;}
			else {return _axis_check;}
		}
        else if (d==in_check_hold) {return _axis_check;}
        else if (d==in_check_release) {
			if (_axis_check) {return global.c_axisl_l;}
			else {return false;}
		}
    break;
    case in_right:
		var _axis_check = gp_get_axis(in_right, global.gp_slot[p], p);
		if (d==in_check_press) {
			if (global.c_axisl_r) {return false;}
			else {return _axis_check;}
		}
        else if (d==in_check_hold) {return _axis_check;}
        else if (d==in_check_release) {
			if (_axis_check) {return global.c_axisl_r;}
			else {return false;}
		}
    break;
	case in_up_right:
		var _axis_check = gp_get_axis(in_up_right, global.gp_slot[p], p);
		if (d==in_check_press) {
			if (global.c_axisl_ur) {return false;}
			else {return _axis_check;}
		}
        else if (d==in_check_hold) {return _axis_check;}
        else if (d==in_check_release) {
			if (_axis_check) {return global.c_axisl_ur;}
			else {return false;}
		}
    break;
	case in_up_left:
		var _axis_check = gp_get_axis(in_up_left, global.gp_slot[p], p);
		if (d==in_check_press) {
			if (global.c_axisl_ul) {return false;}
			else {return _axis_check;}
		}
        else if (d==in_check_hold) {return _axis_check;}
        else if (d==in_check_release) {
			if (_axis_check) {return global.c_axisl_ul;}
			else {return false;}
		}
    break;
	case in_down_left:
		var _axis_check = gp_get_axis(in_down_left, global.gp_slot[p], p);
		if (d==in_check_press) {
			if (global.c_axisl_dl) {return false;}
			else {return _axis_check;}
		}
        else if (d==in_check_hold) {return _axis_check;}
        else if (d==in_check_release) {
			if (_axis_check) {return global.c_axisl_dl;}
			else {return false;}
		}
    break;
	case in_down_right:
		var _axis_check = gp_get_axis(in_down_right, global.gp_slot[p], p);
		if (d==in_check_press) {
			if (global.c_axisl_dr) {return false;}
			else {return _axis_check;}
		}
        else if (d==in_check_hold) {return _axis_check;}
        else if (d==in_check_release) {
			if (_axis_check) {return global.c_axisl_dr;}
			else {return false;}
		}
    break;
	case in_any:
		if (d==in_check_press) {
			if (gamepad_button_check_pressed(global.gp_slot[p],gp_face1) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_face2) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_face3) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_face4) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_shoulderl) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_shoulderr) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_start) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_select) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_stickl) || 
	        gamepad_button_check_pressed(global.gp_slot[p],gp_stickr) || 
	        (gp_get_axis(in_left, global.gp_slot[p], p) && !global.c_axisl_l[p]) || 
	        (gp_get_axis(in_right, global.gp_slot[p], p)  && !global.c_axisl_r[p]) || 
	        (gp_get_axis(in_up, global.gp_slot[p], p) && !global.c_axisl_u[p]) || 
	        (gp_get_axis(in_down, global.gp_slot[p], p)  && !global.c_axisl_d[p]) || 
			(gp_get_axis(in_down_left, global.gp_slot[p], p) && !global.c_axisl_dl[p]) || 
	        (gp_get_axis(in_down_right, global.gp_slot[p], p)  && !global.c_axisl_dr[p]) || 
	        (gp_get_axis(in_up_left, global.gp_slot[p], p) && !global.c_axisl_ul[p]) || 
	        (gp_get_axis(in_up_right, global.gp_slot[p], p)  && !global.c_axisl_ur[p]) || 
	        (gamepad_button_value(global.gp_slot[p],gp_shoulderlb)>(global.gp_trig_thresh[p]) && !global.c_trig_l[p]) || 
	        (gamepad_button_value(global.gp_slot[p],gp_shoulderrb)>(global.gp_trig_thresh[p]) && !global.c_trig_r[p])) {return true;}
	    else {return false;}	 
		}
	    else if (d==in_check_hold) {
			if (gamepad_button_check(global.gp_slot[p],gp_face1) || 
	        gamepad_button_check(global.gp_slot[p],gp_face2) || 
	        gamepad_button_check(global.gp_slot[p],gp_face3) || 
	        gamepad_button_check(global.gp_slot[p],gp_face4) || 
	        gamepad_button_check(global.gp_slot[p],gp_shoulderl) || 
	        gamepad_button_check(global.gp_slot[p],gp_shoulderr) || 
	        gamepad_button_check(global.gp_slot[p],gp_start) || 
	        gamepad_button_check(global.gp_slot[p],gp_select) || 
	        gamepad_button_check(global.gp_slot[p],gp_stickl) || 
	        gamepad_button_check(global.gp_slot[p],gp_stickr) || 
	        gp_get_axis(in_left, global.gp_slot[p], p) || 
	        gp_get_axis(in_right, global.gp_slot[p], p) || 
	        gp_get_axis(in_up, global.gp_slot[p], p) || 
	        gp_get_axis(in_down, global.gp_slot[p], p) || 
			gp_get_axis(in_down_left, global.gp_slot[p], p) || 
	        gp_get_axis(in_down_right, global.gp_slot[p], p) || 
	        gp_get_axis(in_up_left, global.gp_slot[p], p) || 
	        gp_get_axis(in_up_right, global.gp_slot[p], p) || 
	        gamepad_button_value(global.gp_slot[p],gp_shoulderlb)>(global.gp_trig_thresh[p]) || 
	        gamepad_button_value(global.gp_slot[p],gp_shoulderrb)>(global.gp_trig_thresh[p])) {return true;}
	    else {return false;}
		}
	    else if (d==in_check_release) {
			if (gamepad_button_check_released(global.gp_slot[p],gp_face1) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_face2) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_face3) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_face4) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_shoulderl) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_shoulderr) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_start) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_select) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_stickl) || 
	        gamepad_button_check_released(global.gp_slot[p],gp_stickr) || 
	        (gp_get_axis(in_left, global.gp_slot[p], p) && global.c_axisl_l[p]) || 
	        (gp_get_axis(in_right, global.gp_slot[p], p)  && global.c_axisl_r[p]) || 
	        (gp_get_axis(in_up, global.gp_slot[p], p) && global.c_axisl_u[p]) || 
	        (gp_get_axis(in_down, global.gp_slot[p], p)  && global.c_axisl_d[p]) || 
			(gp_get_axis(in_down_left, global.gp_slot[p], p) && global.c_axisl_dl[p]) || 
	        (gp_get_axis(in_down_right, global.gp_slot[p], p)  && global.c_axisl_dr[p]) || 
	        (gp_get_axis(in_up_left, global.gp_slot[p], p) && global.c_axisl_ul[p]) || 
	        (gp_get_axis(in_up_right, global.gp_slot[p], p)  && global.c_axisl_ur[p]) || 
	        (gamepad_button_value(global.gp_slot[p],gp_shoulderlb)>=(global.gp_trig_thresh[p]) && global.c_trig_l[p]) || 
	        (gamepad_button_value(global.gp_slot[p],gp_shoulderrb)>=(global.gp_trig_thresh[p]) && global.c_trig_r[p])) {return true;}
	    else {return false;}
		}
    break;
    default: return false; break;
}
