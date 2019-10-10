///@description 
draw_self();
//Build string
var _str = "";
if (cursorPos == 0) { _str += "{C=blue}"; }
_str += "Retry?\n";
if (cursorPos == 0) { _str += "{C=white}"; }
if (cursorPos == 1) { _str += "{C=blue}"; }
_str += "Quit\n";
if (cursorPos == 1) { _str += "{C=white}"; }
	
//Draw string
draw_text_formatted(room_width/2 - (font_w*3), (room_height/2), _str);