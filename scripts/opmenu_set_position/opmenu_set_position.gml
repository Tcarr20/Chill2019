///@function opmenu_set_position(menu, entry_num, position)
///@description Set the currently selected 'position' of 'entry_num' in the menu
///@param menu
///@param entry_num
///@param position
var menu = argument0, entry_num = argument1, position = argument2;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	var _type = _entry[? "type"];
	if (_type == om_type_display)
	{
		var _pair = _entry[? "options"];
		_pair[? "value"] = position;
		return true;
	}
	else
	{
		var _type = _entry[? "type"];
		var _list = _entry[? "options"];
		if (_type == om_type_slider)
		{
			var _min = _list[| 0], _max = _list[| 1];
			_entry[? "position"] = clamp(position, _min[? "value"], _max[? "value"]);
			return true;
		}
		else if (_type == om_type_toggle || _type == om_type_select)
		{
			//Error checking
			if (position < 0 || position >= ds_list_size(_list))
			{
				debug_log("[ERROR] OM: Setting position to out of bounds value at");
				return false;
			}
			else
			{
				_entry[? "position"] = position;
				return true;
			}
		}
	}
}
return false;