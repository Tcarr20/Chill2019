///@function opmenu_cursor_increment(menu)
///@description Increment the position of the cursor in menu
///@param menu
var menu = argument0;
if (ds_exists(menu, ds_type_list))
{
	var _data = menu[| 0];
	var _size = _data[? "num_entries"], cursor = _data[? "cursor"], _active = true;
	do 
	{ 
		//Go to the next entry
		cursor = clamp(cursor - 1, 0, _size - 1); 
		//Check if the newly selected entry is active
		var _entry = menu[| cursor + 1];
		_active = _entry[? "active"];
	}
	until ( _active == true );
					
	//Update start line
	var _display = _data[? "display_entries"], _first = _data[? "first_line"];
	var _before = 0, _after = 0;
	for(var i=0; i<min(_size, _display); i++)
	{
		if (i <= (cursor - _first)) { _before++; }
		else { _after++; }
	}
	if (_before < _after && _before <= cursor) { _first -= max(1, (_after - _before) - 1); }

	//Save new values
	_data[? "cursor"] = cursor;
	_data[? "first_line"] = _first;
	return true;
}
return false;