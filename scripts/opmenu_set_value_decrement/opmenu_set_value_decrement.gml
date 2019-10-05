///@function opmenu_set_value_decrement(menu, entry_pos)
///@description Decrement the selected position of 'entry_pos' in the menu
///@param menu
///@param entry_pos
var menu = argument0, entry_pos = argument1;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_pos + 1];
	var _type = _entry[? "type"];
	if (_type == om_type_display)
	{
		debug_log("[ERROR] OM: Incrementing invalid type at");
		return false;
	}
	else
	{
		var _type = _entry[? "type"];
		var _list = _entry[? "options"];
		if (_type == om_type_slider)
		{
			var _min = _list[| 0], _max = _list[| 1], _delta = _list[| 2];
			var _pos = _entry[? "position"];
			_entry[? "position"] = clamp(_pos - (_delta[? "value"]), _min[? "value"], _max[? "value"]);
			return true;
		}
		else if (_type == om_type_toggle || _type == om_type_select)
		{
			var _pos = _entry[? "position"];
			_entry[? "position"] = wrap(_pos - 1, 0, ds_list_size(_list) - 1);
			return true;
		}
	}
}
return false;