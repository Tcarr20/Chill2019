///@function opmenu_clear(menu)
///@description Clear all the entries in a menu
///@param menu
var menu = argument0;
if (ds_exists(menu, ds_type_list)) 
{ 
	//Save data
	var _data = menu[| 0];
	var _display = _data[? "display_entries"], _callback = _data[? "callback"], _args = _data[? "args"];
	//Delete all entries
	ds_list_clear(argument0);
	//Recreate data section
	var _data = ds_map_create();
	_data[? "cursor"] = 0;
	_data[? "select"] = false;
	_data[? "num_entries"] = 0;
	_data[? "display_entries"] = _display;
	_data[? "first_line"] = 0;
	_data[? "memory"] = undefined;
	_data[? "callback"] = _callback;
	_data[? "args"] = _args;
	ds_list_add(menu, _data);
	return true;
}
else { return false; }