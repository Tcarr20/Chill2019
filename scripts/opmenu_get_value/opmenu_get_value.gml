///@function opmenu_get_value(menu, entry_num)
///@description Get the value of the currentlt selected option in 'entry_num' in the menu
///@param menu
///@param entry_num
var menu = argument[0], entry_num = argument[1];
if (ds_exists(menu, ds_type_list))
{
	var _entry = menu[| entry_num + 1];
	var _type = _entry[? "type"];
	if (_type == om_type_display)
	{
		var _pair = _entry[? "options"];
		return _pair[? "value"];
	}
	else if (_type == om_type_slider) { return _entry[? "position"]; }
	else
	{
		var _position = _entry[? "position"];
		var _list = _entry[? "options"];
		var _pair = _list[| _position];
		return _pair[? "value"];
	}
}
return undefined;