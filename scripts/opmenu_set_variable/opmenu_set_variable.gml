///@function opmenu_set_variable(menu, entry_num, variable)
///@description Set 'entry_num' variable
///@param menu
///@param entry_num
///@param variable
var menu = argument0, entry_num = argument1, variable = argument2;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	_entry[? "variable"] = variable;
	return true;
}
return false;