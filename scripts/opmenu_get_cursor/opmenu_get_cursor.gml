///@function opmenu_get_active(menu)
///@description Get the current position of the cursor in the menu
///@param menu
var menu = argument0;
if (ds_exists(menu, ds_type_list))
{
	var _data = menu[| 0];
	return _data[? "cursor"];
}
return undefined;