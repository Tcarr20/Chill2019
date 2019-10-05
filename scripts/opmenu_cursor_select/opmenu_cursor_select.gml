///@function opmenu_cursor_select(menu)
///@description Select the entry pointed to by the cursor in the menu
///@param menu
var menu = argument0;
if (ds_exists(menu, ds_type_list))
{
	//Select entry if nothing has been selected
	var _data = menu[| 0];
	var _cursor = _data[? "cursor"];
	var _entry = menu[| _cursor + 1];
	var _type = _entry[? "type"];
	
	//Trigger the callback if its type display
	if (_type == om_type_display) { opmenu_trigger_callback(menu, _cursor); }
	else
	{
		if (!_data[? "select"]) 
		{ 
			_data[? "select"] = true; 
			_data[? "memory"] = _entry[? "position"];
		}
		else
		{
			//Toggle state if entry is type toggle
			if (_type == om_type_toggle) { opmenu_set_value_increment(menu, _cursor); }
			else
			{
				//Confirm state
				_data[? "select"] = false; 
				_data[? "memory"] = undefined;
			}
			
			//Update variable
			opmenu_read_value(menu, _cursor);
		
			//Trigger entry callback
			opmenu_trigger_callback(menu, _cursor);
		}
	}
}
return false;