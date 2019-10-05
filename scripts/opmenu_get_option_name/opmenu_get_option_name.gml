///@function opmenu_get_option_name(menu, entry_num, [position])
///@description Get the name of the 'option' in 'position' of 'entry_num' in the menu
///@param menu
///@param entry_num
///@param [position]
var menu = argument[0], entry_num = argument[1], position = (argument_count > 2)? argument[2] : undefined;
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	var _type = _entry[? "type"];
	if (_type == om_type_display)
	{
		var _pair = _entry[? "options"];
		return _pair[? "name"];
	}
	else
	{
		//Default to the currently selected position
		if (position == undefined) 
		{ 
			if (_type == om_type_slider) 
			{ 
				debug_log("[ERROR] OM: Failed to specify min/max position for slider type option at");
				return undefined;
			}
			else { position = _entry[? "position"]; }
		}
		var _list = _entry[? "options"];
		var _pair = _list[| position];
		return _pair[? "name"];
	}
}
return undefined;