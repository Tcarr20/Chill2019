///@description 
if (get_in(in_up, in_check_press, 0)) {cursorPos = 0;}
if (get_in(in_down, in_check_press, 0)) {cursorPos = 1;}
if (get_in(in_a, in_check_press, 0)) {
	if (cursorPos == 0) { game_restart(); }
	else { game_end(); }
}