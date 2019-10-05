///@function opmenu_get_size(menu)
///@description Get the number of entries in the menu
///@param menu
var menu = argument0;
if (ds_exists(menu, ds_type_list)) 
{ 
	var _data = menu[| 0];
	return _data[? "num_entries"]; 
}
else { return undefined; }