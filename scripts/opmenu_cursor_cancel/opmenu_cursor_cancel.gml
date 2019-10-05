///@function opmenu_cursor_cancel(menu)
///@description Cancel the currently selected entry pointed to by the cursor in menu
///@param menu
var menu = argument0;
if (ds_exists(menu, ds_type_list))
{
	//Cancel if something is currently selected
	var _data = menu[| 0];
	var _cursor = _data[? "cursor"];
	var _entry = menu[| _cursor + 1];
	if (_data[? "select"]) 
	{ 
		//Revert to previous value if not a toggle
		var _type = _entry[? "type"];
		if (_type != om_type_toggle) { _entry[? "position"] = _data[? "memory"]; }
		
		//Deselect
		_data[? "select"] = false; 
		_data[? "memory"] = undefined;
	}
	else
	{
		//Triger menu cancel callback
		if (_data[? "callback"] != undefined) { script_execute_args(_data[? "callback"], _data[? "args"]); }
	}
}
return false;