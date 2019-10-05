///@description Save most recent gamepad input
for(var i=0; i<NUM_PLAYERS; i++) {
	if (gp_get_axis(in_left, global.gp_slot[i], i)) { gamepad_last[i] = gp_axisl_l; }
	if (gp_get_axis(in_right, global.gp_slot[i], i)) { gamepad_last[i] = gp_axisl_r; }
	if (gp_get_axis(in_up, global.gp_slot[i], i)) { gamepad_last[i] = gp_axisl_u; }
	if (gp_get_axis(in_down, global.gp_slot[i], i)) { gamepad_last[i] = gp_axisl_d; }
	if (gp_get_axis(in_down_left, global.gp_slot[i], i)) { gamepad_last[i] = gp_axisl_dl; }
	if (gp_get_axis(in_down_right, global.gp_slot[i], i)) { gamepad_last[i] = gp_axisl_dr; }
	if (gp_get_axis(in_up_left, global.gp_slot[i], i)) { gamepad_last[i] = gp_axisl_ul; }
	if (gp_get_axis(in_up_right, global.gp_slot[i], i)) { gamepad_last[i] = gp_axisl_ur; }
	if (gamepad_button_value(global.gp_slot[i], gp_shoulderlb)>global.gp_trig_thresh[i]) { gamepad_last[i] = gp_shoulderlb; }
	if (gamepad_button_value(global.gp_slot[i], gp_shoulderrb)>global.gp_trig_thresh[i]) { gamepad_last[i] = gp_shoulderrb; }
	if (gamepad_button_check(global.gp_slot[i], gp_face1)) { gamepad_last[i] = gp_face1; }
	if (gamepad_button_check(global.gp_slot[i], gp_face2)) { gamepad_last[i] = gp_face2; }
	if (gamepad_button_check(global.gp_slot[i], gp_face3)) { gamepad_last[i] = gp_face3; }
	if (gamepad_button_check(global.gp_slot[i], gp_face4)) { gamepad_last[i] = gp_face4; }
	if (gamepad_button_check(global.gp_slot[i], gp_padd)) { gamepad_last[i] = gp_padd; }
	if (gamepad_button_check(global.gp_slot[i], gp_padu)) { gamepad_last[i] = gp_padu; }
	if (gamepad_button_check(global.gp_slot[i], gp_padl)) { gamepad_last[i] = gp_padl; }
	if (gamepad_button_check(global.gp_slot[i], gp_padr)) { gamepad_last[i] = gp_padr; }
	if (gamepad_button_check(global.gp_slot[i], gp_start)) { gamepad_last[i] = gp_start; }
	if (gamepad_button_check(global.gp_slot[i], gp_select)) { gamepad_last[i] = gp_select; }
	if (gamepad_button_check(global.gp_slot[i], gp_shoulderl)) { gamepad_last[i] = gp_shoulderl; }
	if (gamepad_button_check(global.gp_slot[i], gp_shoulderr)) { gamepad_last[i] = gp_shoulderr; }
	if (gamepad_button_check(global.gp_slot[i], gp_stickl)) { gamepad_last[i] = gp_stickl; }
	if (gamepad_button_check(global.gp_slot[i], gp_stickr)) { gamepad_last[i] = gp_stickr; }
}