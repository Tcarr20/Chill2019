///@function opmenu_write_value(menu, entry_num)
///@description Write the value of the entry_num variable to the menu
///@param menu
///@param entry_num
var menu = argument0, entry_num = argument1;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	if (_entry[? "variable"] != undefined)
	{
		if (variable_global_exists(_entry[? "variable"]))
		{
			var _value = variable_global_get(_entry[? "variable"]);
			var _type = _entry[? "type"];
			if (_type == om_type_display)
			{
				var _pair = _entry[? "options"];
				_pair[? "value"] = _value
				return true;
			}
			else
			{
				var _list = _entry[? "options"];
				if (_type == om_type_slider)
				{
					//Clamp the variables value to the min & max
					var _min = _list[| 0], _max = _list[| 1];
					if (_value == undefined) { _value = _min[? "value"]; }
					_entry[? "position"] = clamp(_value, _min[? "value"], _max[? "value"]);
					return true;
				}
				else if (_type == om_type_toggle || _type == om_type_select)
				{
					//Iterate through options to find the one that matches the variables value
					for(var j=0; j<ds_list_size(_list); j++)
					{
						var _pair = _list[| j];
						if (_pair[? "value"] == _value)
						{
							_entry[? "position"] = j;
							return true;
						}
					}
					//Failed to find it
					_entry[? "position"] = 0;
				}
			}
		}
	}
}
return false;