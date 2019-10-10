///@description Commands
if (keyboard_check(vk_lshift)) {
	if (keyboard_check_pressed(vk_escape)) { game_end(); }
	else if (keyboard_check_pressed(ord("R"))) { game_restart(); }
	
	else if (keyboard_check_pressed(ord("D")) && instance_exists(objPlayer)) { room_goto_next(); } 
	else if (keyboard_check_pressed(ord("F")) && instance_exists(objPlayer)) { room_goto_previous(); } 
}

if (room != Title && room != rmGameOver) {
	if (instance_number(objPlayer) == 0) {
		room_goto_effect(rmGameOver, rm_trans_fade);
	}
}