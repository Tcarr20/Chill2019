///@function opmenu_trigger_callback(menu, entry_pos)
///@description Trigger the callback of 'entry_pos' in the menu
///@param menu
///@param position
var menu = argument0, entry_pos = argument1;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_pos + 1];
	if (_entry[? "callback"] != undefined) { script_execute_args(_entry[? "callback"], _entry[? "args"]); }
}