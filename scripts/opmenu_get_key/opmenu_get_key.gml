///@function opmenu_get_key(menu, entry_num)
///@description Get the key of the option at the entry in the menu
///@param menu
///@param entry_num
var menu = argument0, entry_num = argument1;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	return _entry[? "key"];
}
return undefined;