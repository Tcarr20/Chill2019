///@description Draw text & menus
draw_self();
draw_set_halign(fa_center)
if (myState == 0) {
	//Build string
	var _str = "";
	if (cursorPos == 0) { _str += "{C=blue}"; }
	_str += "Start\n";
	if (cursorPos == 0) { _str += "{C=white}"; }
	if (cursorPos == 1) { _str += "{C=blue}"; }
	_str += "Credits\n";
	if (cursorPos == 1) { _str += "{C=white}"; }
	
	//Draw string
	draw_text_formatted(room_width/2 - (font_w*3), (room_height/2), _str);
}
else if (myState == 1) {
	//Draw player one text
	var _str = "Player One\n";
	if (global.gp_slot[0] == -1) { _str += "{C=red}No Controller\nConnected!{C=white}"; }
	else { _str += "Press A ("+string(playerOneReady)+")"; }
	draw_text_formatted((room_width/4) - (font_w*4), room_height/2, _str);
	
	//Draw player two text
	var _str = "Player Two\n";
	if (global.gp_slot[1] == -1) { _str += "{C=red}No Controller\nConnected!{C=white}"; }
	else { _str += "Press A ("+string(playerTwoReady)+")"; }
	draw_text_formatted((room_width/2) - (font_w*4), room_height/2, _str);
	
	//Draw player three text
	var _str = "Player Three\n";
	if (global.gp_slot[2] == -1) { _str += "{C=red}No Controller\nConnected!{C=white}"; }
	else { _str += "Press A ("+string(playerThreeReady)+")"; }
	draw_text_formatted((3*room_width/4) - (font_w*4), room_height/2, _str);
}
draw_set_halign(fa_left)