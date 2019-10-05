///@function opmenu_get_active(menu, entry_num)
///@description Get the active flag of the option at the entry_num in the menu
///@param menu
///@param entry_num
var menu = argument0, entry_num = argument1;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	return _entry[? "active"];
}
return undefined;