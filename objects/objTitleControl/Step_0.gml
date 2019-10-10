///@description Poll for controllers
if (scrStop()) { exit; }
for(var i=0; i<gamepad_get_device_count(); i++) {
	//If a gamepad is no longer connected
	for(var j=0; j<NUM_PLAYERS; j++) {
		if (global.gp_slot[j] != -1) {
			if (global.gp_slot[j] == i && !gamepad_is_connected(i)) {
				global.gp_slot[j] = -1;
				break;
			}
		}
	}
	
	//If a gamepad is connected in slot i...
	for(var j=0; j<NUM_PLAYERS; j++) {
		if (global.gp_slot[j] == -1) {
			if (gamepad_is_connected(i) && !gamepad_is_taken(i)) {
				global.gp_slot[j] = i;
				break;
			}
		}
			
	}
}

if (myState == 0) {
	if(get_in(in_a, in_check_press, 0)) {
		if (cursorPos == 0) { myState = 1; }
		else if (cursorPos == 1) { db_create(tb_static, -1, -1, "{M=wave}~~~{M=normal}Created by Alex Stenzel, Anthony Carr, Ephraim Jackson, and Cameron Donner. Chillenium 2019, Game Maker Studio 2.{M=wave}~~~{M=normal}") }
		else { game_end(); }
	}
	if (get_in(in_down, in_check_press, 0)) { cursorPos = wrap(cursorPos + 1, 0, 2); }
	if (get_in(in_up, in_check_press, 0)) { cursorPos = wrap(cursorPos - 1, 0, 2); }
}
else if (myState == 1) {
	if (get_in(in_a, in_check_hold, 0)) { playerOneReady = clamp(playerOneReady + 1, 0, 30); }
	else { playerOneReady = clamp(playerOneReady - 1, 0, 30); }
	if (get_in(in_a, in_check_hold, 1)) { playerTwoReady = clamp(playerTwoReady + 1, 0, 30); }
	else { playerTwoReady = clamp(playerTwoReady - 1, 0, 30); }
	if (get_in(in_a, in_check_hold, 2)) { playerThreeReady = clamp(playerThreeReady + 1, 0, 30); }
	else { playerThreeReady = clamp(playerThreeReady - 1, 0, 30); }
	
	if (playerOneReady == 30 && playerTwoReady == 30 && playerThreeReady == 30) {
		audio_stop_all();
		room_goto(rmSlideFourDir);
	}
	
	if (get_in(in_b, in_check_press, 0)) { myState = 0; }
}