///@function opmenu_add_option(menu, key, type, variable, names[], values[], [active], [callback], [args[]])
///@description Append a new entry to the menu
///@param menu
///@param key
///@param type
///@param variable
///@param names
///@param values
///@param [active]
///@param [callback]
///@param [args[]]
var menu = argument[0], key = argument[1], type = argument[2];
var variable = argument[3], names = argument[4], values = argument[5];
var active = (argument_count > 6)? argument[6] : true;
var callback = (argument_count > 7)? argument[7] : undefined;
var args = (argument_count > 8)? argument[8] : undefined;
if (ds_exists(menu, ds_type_list))
{
	//Error checking
	if ((is_array(names) && is_array(values)) && (array_length_1d(names) != array_length_1d(values))) 
	{
		debug_log("[ERROR] OM: Name and Value size mismatch at");
		return undefined;
	}
		
	//Create entry map
	var _entry = ds_map_create();
		
	if (type == om_type_display)
	{
		//Create name/value pair
		var _pair = ds_map_create();
		_pair[? "name"] = names;
		_pair[? "value"] = values;
		
		//Add pair to the entry map
		_entry[? "key"] = key;
		_entry[? "type"] = type;
		_entry[? "variable"] = variable;
		_entry[? "position"] = 0;
		_entry[? "active"] = active;
		_entry[? "callback"] = callback;
		_entry[? "args"] = args;
		_entry[? "options"] = _pair;
	}
	else if (type == om_type_toggle || type == om_type_slider)
	{
		//Create list of name/value pairs and add them to the pair list
		var _list = ds_list_create();
		for(var j=0; j<2; j++)
		{
			var _pair = ds_map_create();
			_pair[? "name"] = names[j];
			_pair[? "value"] = values[j];
			ds_list_add(_list, _pair);
		}
		
		//Add the pair list to the entry map
		_entry[? "key"] = key;
		_entry[? "type"] = type;
		_entry[? "variable"] = variable;
		_entry[? "position"] = 0;
		_entry[? "active"] = active;
		_entry[? "callback"] = callback;
		_entry[? "args"] = args;
		_entry[? "options"] = _list;
	}
	else if (type == om_type_select)
	{
		//Create list of name/value pairs and add them to the pair list
		var _list = ds_list_create();
		for(var j=0; j<array_length_1d(names); j++)
		{
			var _pair = ds_map_create();
			_pair[? "name"] = names[j];
			_pair[? "value"] = values[j];
			ds_list_add(_list, _pair);
		}
		
		//Add the pair list to the entry map
		_entry[? "key"] = key;
		_entry[? "type"] = type;
		_entry[? "variable"] = variable;
		_entry[? "position"] = 0;
		_entry[? "active"] = active;
		_entry[? "callback"] = callback;
		_entry[? "args"] = args;
		_entry[? "options"] = _list;
	}
	
	//Add the entry map to the menu
	ds_list_add(menu, _entry);
	var _data = menu[| 0];
	_data[? "num_entries"] += 1;
	
	//Set the initial value of the entry
	opmenu_write_value(menu, _data[? "num_entries"] - 1);
}
return true;