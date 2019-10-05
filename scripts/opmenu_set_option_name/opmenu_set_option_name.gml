///@function opmenu_set_option_name(menu, entry_num, position, name)
///@description Set the name of the 'option' in 'position' of 'entry_num' in the menu
///@param menu
///@param entry_num
///@param position
///@param name
var menu = argument0, entry_num = argument1, position = argument2, name = argument3;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	var _type = _entry[? "type"];
	if (_type == om_type_display)
	{
		var _pair = _entry[? "options"];
		_pair[? "name"] = name;
		return true;
	}
	else
	{
		//Error checking
		if (position < 0 || position >= ds_list_size(_list))
		{
			debug_log("[ERROR] OM: Setting position to out of bounds value at");
			return false;
		}
		else
		{
			var _type = _entry[? "type"];
			var _list = _entry[? "options"];
			var _pair = _list[| position];
			_pair[? "name"] = name;
			return true;
		}
	}
}
return false;