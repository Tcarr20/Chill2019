///@function opmenu_set_active(menu, entry_num, active)
///@description Set 'entry_num' to be active or not
///@param menu
///@param entry_num
///@param active
var menu = argument0, entry_num = argument1, active = argument2;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	_entry[? "active"] = active;
	return true;
}
return false;