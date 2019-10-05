///@function opmenu_entry_cursor_decrement(menu)
///@description Decrement the position of the selected entry in menu
///@param menu
var menu = argument0;
if (ds_exists(menu, ds_type_list))
{
	//Check in an entry is selected
	var _data = menu[| 0];
	if (_data[? "select"])
	{
		var _cursor = _data[? "cursor"];
		opmenu_set_value_decrement(menu, _cursor);
		return true;
	}
}
return false;