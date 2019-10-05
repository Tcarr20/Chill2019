///@function opmenu_get_position(menu, entry_num)
///@description Get the currently selected position of the 'entry_num' in the menu
///@param menu
///@param entry_num
var menu = argument[0], entry_num = argument[1];
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	var _type = _entry[? "type"];
	if (_type == om_type_display) { debug_log("[ERROR] Attempting to get the position of a display value at"); }
	else { return _entry[? "position"]; }
}
return undefined;