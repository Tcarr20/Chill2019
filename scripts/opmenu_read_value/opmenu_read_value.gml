///@function opmenu_variable_read_value(menu, entry_num)
///@description Set the varible of the entry_num in the menu to that entries current value
///@param menu
///@param entry_num
var menu = argument[0], entry_num = argument[1], _value = undefined;
if (ds_exists(menu, ds_type_list))
{
	//Get the keys current value
	var _entry = menu[| entry_num + 1];
	var _variable = _entry[? "variable"];
	if (_variable != undefined)
	{
		var _type = _entry[? "type"];
		if (_type == om_type_display)
		{
			var _pair = _entry[? "options"];
			_value = _pair[? "value"];
		}
		else if (_type == om_type_slider) { _value = _entry[? "position"]; }
		else
		{
			var _position = _entry[? "position"];
			var _list = _entry[? "options"];
			var _pair = _list[| _position];
			_value =  _pair[? "value"];
		}
	
		//Update the keys variable
		if (variable_global_exists(_variable))
		{
			variable_global_set(_variable, _value);
			return true;
		}
	}
}
return false;