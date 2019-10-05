///@function opmenu_set_key(menu, entry_num, key)
///@description Set the 'key' of 'entry_num' in the menu
///@param menu
///@param entry_num
///@param key
var menu = argument0, entry_num = argument1, key = argument2;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	_entry[? "key"] = key;
	return true;
}
return false;